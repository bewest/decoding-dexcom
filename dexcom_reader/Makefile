
#PATH=?${PATH}:./

all: scan \
	status \
	records-meter \
	records-cgm   \
	records-user-events \
	records-insertion


scan: logs/scan.log.markdown
	# $*

status: logs/status.log.markdown
records-meter: logs/records-meter.log.markdown
records-cgm: logs/records-cgm.log.markdown
records-user-events: logs/records-user-events.log.markdown
records-insertion: logs/records-insertion.log.markdown

logs/%.log.markdown: dxcom-%
	./$< | tee -a $@

#####
# EOF
