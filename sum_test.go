package template_test

import (
	"testing"

	"github.com/stretchr/testify/assert"

	template "github.com/selfshop-dev/tmpl-base"
)

func TestSum(t *testing.T) {
	t.Parallel()

	testCases := [...]struct {
		name string
		a    int
		b    int
		want int
	}{
		{name: "positive numbers", a: 2, b: 3, want: 5},
		{name: "zero values", a: 0, b: 0, want: 0},
		{name: "negative numbers", a: -2, b: -3, want: -5},
		{name: "mixed signs", a: -1, b: 1, want: 0},
		{name: "large values", a: 1 << 30, b: 1 << 30, want: 1 << 31},
	}

	for _, tc := range testCases {
		tc := tc
		t.Run(tc.name, func(t *testing.T) {
			t.Parallel()
			assert.Equal(t, tc.want, template.Sum(tc.a, tc.b))
		})
	}
}
