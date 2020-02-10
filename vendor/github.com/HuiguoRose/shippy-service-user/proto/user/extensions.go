package user

import (
	"github.com/jinzhu/gorm"
	"github.com/satori/go.uuid"
)

func (user *User) BeforeCreate(scope *gorm.Scope) error {
	id := uuid.NewV4()
	return scope.SetColumn("Id", id.String())
}
