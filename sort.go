package main

import "github.com/slack-go/slack"

type byTimestamp []slack.Message

func (m byTimestamp) Len() int           { return len(m) }
func (m byTimestamp) Swap(i, j int)      { m[i], m[j] = m[j], m[i] }
func (m byTimestamp) Less(i, j int) bool { return m[i].Timestamp < m[j].Timestamp }
