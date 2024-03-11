// Image Selector
const dragArea = document.querySelector('.drag-area')
const fileInput = document.querySelector('.drag-area input[type="file"]')
const selectedImg = dragArea.querySelector('.selected-img')
const browseBtn = document.querySelector('.drag-area .browse-btn')
const clearFileBtn = document.querySelector('.clear-file-btn')
const validFileType = ["image/jpeg", "image/jpg", "image/png"]

let file


document.querySelector('form').addEventListener('keydown', (event) => {
	if (event.key === 'Enter') {
		event.preventDefault();
	}
})

browseBtn.addEventListener('click', (event) => {
	event.preventDefault()
	fileInput.click()
})

clearFileBtn.addEventListener('click', function(event) {
	event.preventDefault()
	file = undefined;
	dragArea.classList.remove('active')
	selectedImg.src = "";
	fileInput.value = "";
	this.classList.remove('show');
})

browseBtn.addEventListener('click', (event) => {
	event.preventDefault()
})

fileInput.addEventListener('change', (event) => {
	file = event.target.files[0]
	displayFileImage()
})


dragArea.addEventListener('dragover', (event) => {
	event.preventDefault()
	dragArea.classList.add('dragging')
})


dragArea.addEventListener('dragleave', () => {
	dragArea.classList.remove('dragging')
	console.log('Drag leave')
})

dragArea.addEventListener('drop', (event) => {
	event.preventDefault()
	const fileSelected = event.dataTransfer.files[0]
	if (validFileType.includes(fileSelected.type)) {
		file = fileSelected
		fileInput.files = event.dataTransfer.files
		dragArea.classList.remove('dragging')
		displayFileImage()
	}
	else
		alert("File đã chọn phải có định dạng JPEG, PNG hoặc JPG")
})


function displayFileImage() {

	let fileReader = new FileReader()
	fileReader.onload = () => {
		let fileURL = fileReader.result
		selectedImg.src = fileURL
		dragArea.classList.add('active');
		clearFileBtn.classList.add('show');
	}
	fileReader.readAsDataURL(file)

}


// //Tag
// (() => {
// 	const tagBox = document.querySelector('.tag-box')
// 	const tagInput = document.querySelector('.tag-input')
// 	let tags = []
// 	const removeAllTagBtn = document.querySelector('.remove-all-tag-btn')
// 	return {
// 		eventHandle: function() {
// 			_this = this;
// 			tagInput.addEventListener('keyup', (event) => {
// 				if (event.key == "Enter") {
// 					let tag = event.target.value.replace(/\+/g, ' ')
// 					if (tag.length >= 1 && !tags.includes(tag)) {
// 						tag.split(',').forEach(tag => {
// 							tags.push(tag)
// 							event.target.value = ""
// 							let newTag = document.createElement('li')
// 							newTag.innerHTML = `<li class="tag-item">${tag}<i class="fa-solid fa-xmark remove-tag-btn"></i></li>`
//
// 							tagBox.insertBefore(newTag, tagInput)
// 							newTag.querySelector('.remove-tag-btn').addEventListener('click', () => {
// 								_this.removeTag(newTag, tag)
// 							})
// 						})
// 					}
// 				}
// 			})
// 			removeAllTagBtn.addEventListener('click', () => {
// 				if (tags.length > 0) {
// 					tags.length = 0
// 					tagBox.querySelectorAll('li').forEach((li) => {
// 						li.remove()
// 					})
// 				}
// 			})
// 		},
//
// 		removeTag: (element, tag) => {
// 			console.log(element, tag)
// 			let index = tags.indexOf(tag)
// 			tags = [...tags.slice(0, index), ...tags.slice(index + 1)]
// 			element.remove()
// 		},
//
// 		init: function() {
// 			this.eventHandle()
// 		}
// 	}
//
// })().init()







