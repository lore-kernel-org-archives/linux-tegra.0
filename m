From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH v4 0/5] Tegra 2 NAND Flash Support
Date: Mon,  2 Nov 2015 21:33:17 +0100
Message-ID: <1446496402-8142-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi all,

New and hopefully last round of the Tegra NAND controller driver.
I fixed some last bugs that people found during review and testing
and I think the driver is ready for merging.

v4 fixes some minor errors in the ECC handling and makes timing
calculations a bit more conservative.

Regards,
Lucas

------------------------>8------------------------------------------
Cover letter from v2/v3:

Performance is up a bit, and now seems to be in the range that
one could expect from the device. According to some simple
benchmarks (thanks Stefan) this driver is faster than the L4T
downstream driver.

Also the driver got a significant amount of testing, which revealed
some problems with ECC handling which should now be all fixed. MTD
test results attached.

[root@localhost ~]# insmod /root/mtd-tests/mtd_speedtest.ko dev=1
[  108.607611] 
[  108.612143] =================================================
[  108.617913] mtd_speedtest: MTD device: 1
[  108.622930] mtd_speedtest: MTD device size 67108864, eraseblock size 524288, page size 4096, count of eraseblocks 128, pages per eraseblock 128, OOB size 224
[  108.677678] mtd_test: scanning for bad eraseblocks
[  108.682616] mtd_test: scanned 128 eraseblocks, 0 are bad
[  108.786282] mtd_speedtest: testing eraseblock write speed
[  116.735746] mtd_speedtest: eraseblock write speed is 8403 KiB/s
[  116.741699] mtd_speedtest: testing eraseblock read speed
[  121.365402] mtd_speedtest: eraseblock read speed is 14256 KiB/s
[  121.509170] mtd_speedtest: testing page write speed
[  129.700082] mtd_speedtest: page write speed is 8012 KiB/s
[  129.705515] mtd_speedtest: testing page read speed
[  134.377940] mtd_speedtest: page read speed is 14039 KiB/s
[  134.521148] mtd_speedtest: testing 2 page write speed
[  142.564004] mtd_speedtest: 2 page write speed is 8154 KiB/s
[  142.569610] mtd_speedtest: testing 2 page read speed
[  147.221758] mtd_speedtest: 2 page read speed is 14099 KiB/s
[  147.227360] mtd_speedtest: Testing erase speed
[  147.369935] mtd_speedtest: erase speed is 474898 KiB/s
[  147.375105] mtd_speedtest: Testing 2x multi-block erase speed
[  147.456717] mtd_speedtest: 2x multi-block erase speed is 873813 KiB/s
[  147.463163] mtd_speedtest: Testing 4x multi-block erase speed
[  147.546198] mtd_speedtest: 4x multi-block erase speed is 862315 KiB/s
[  147.552643] mtd_speedtest: Testing 8x multi-block erase speed
[  147.635005] mtd_speedtest: 8x multi-block erase speed is 873813 KiB/s
[  147.641449] mtd_speedtest: Testing 16x multi-block erase speed
[  147.723454] mtd_speedtest: 16x multi-block erase speed is 873813 KiB/s
[  147.730037] mtd_speedtest: Testing 32x multi-block erase speed
[  147.810388] mtd_speedtest: 32x multi-block erase speed is 897753 KiB/s
[  147.816953] mtd_speedtest: Testing 64x multi-block erase speed
[  147.897626] mtd_speedtest: 64x multi-block erase speed is 885621 KiB/s
[  147.904147] mtd_speedtest: finished
[  147.908506] =================================================


[root@localhost tracing]# insmod /root/mtd-tests/mtd_nandbiterrs.ko dev=1 mode=0
[  847.750322] 
[  847.752043] ==================================================
[  847.758447] mtd_nandbiterrs: MTD device: 1
[  847.763943] mtd_nandbiterrs: MTD device size 67108864, eraseblock=524288, page=4096, oob=224
[  847.772994] mtd_nandbiterrs: Device uses 1 subpages of 4096 bytes
[  847.780302] mtd_nandbiterrs: Using page=0, offset=0, eraseblock=0
[  847.788279] mtd_nandbiterrs: incremental biterrors test
[  847.794983] mtd_nandbiterrs: write_page
[  847.801992] mtd_nandbiterrs: rewrite page
[  847.874682] mtd_nandbiterrs: read_page
[  847.878846] mtd_nandbiterrs: Read reported 56 corrected bit errors
[  847.885031] mtd_nandbiterrs: verify_page
[  847.889403] mtd_nandbiterrs: Successfully corrected 0 bit errors per subpage
[  847.896474] mtd_nandbiterrs: Inserted biterror @ 0/5
[  847.901482] mtd_nandbiterrs: rewrite page
[  847.925317] mtd_nandbiterrs: read_page
[  847.929485] mtd_nandbiterrs: Read reported 8 corrected bit errors
[  847.935583] mtd_nandbiterrs: verify_page
[  847.940013] mtd_nandbiterrs: Successfully corrected 1 bit errors per subpage
[  847.947068] mtd_nandbiterrs: Inserted biterror @ 0/2
[  847.952082] mtd_nandbiterrs: rewrite page
[  847.975999] mtd_nandbiterrs: read_page
[  847.980167] mtd_nandbiterrs: Read reported 8 corrected bit errors
[  847.986265] mtd_nandbiterrs: verify_page
[  847.990618] mtd_nandbiterrs: Successfully corrected 2 bit errors per subpage
[  847.997738] mtd_nandbiterrs: Inserted biterror @ 0/0
[  848.002898] mtd_nandbiterrs: rewrite page
[  848.026749] mtd_nandbiterrs: read_page
[  848.030917] mtd_nandbiterrs: Read reported 16 corrected bit errors
[  848.037102] mtd_nandbiterrs: verify_page
[  848.041443] mtd_nandbiterrs: Successfully corrected 3 bit errors per subpage
[  848.048537] mtd_nandbiterrs: Inserted biterror @ 1/7
[  848.053688] mtd_nandbiterrs: rewrite page
[  848.077456] mtd_nandbiterrs: read_page
[  848.081621] mtd_nandbiterrs: Read reported 24 corrected bit errors
[  848.087924] mtd_nandbiterrs: verify_page
[  848.092014] mtd_nandbiterrs: Successfully corrected 4 bit errors per subpage
[  848.099105] mtd_nandbiterrs: Inserted biterror @ 1/5
[  848.104076] mtd_nandbiterrs: rewrite page
[  848.127738] mtd_nandbiterrs: read_page
[  848.131855] mtd_nandbiterrs: Read reported 24 corrected bit errors
[  848.138101] mtd_nandbiterrs: verify_page
[  848.142174] mtd_nandbiterrs: Successfully corrected 5 bit errors per subpage
[  848.149263] mtd_nandbiterrs: Inserted biterror @ 1/2
[  848.154234] mtd_nandbiterrs: rewrite page
[  848.178076] mtd_nandbiterrs: read_page
[  848.182247] mtd_nandbiterrs: Read reported 24 corrected bit errors
[  848.188484] mtd_nandbiterrs: verify_page
[  848.192558] mtd_nandbiterrs: Successfully corrected 6 bit errors per subpage
[  848.199654] mtd_nandbiterrs: Inserted biterror @ 1/0
[  848.204625] mtd_nandbiterrs: rewrite page
[  848.228465] mtd_nandbiterrs: read_page
[  848.232583] mtd_nandbiterrs: Read reported 24 corrected bit errors
[  848.238824] mtd_nandbiterrs: verify_page
[  848.242898] mtd_nandbiterrs: Successfully corrected 7 bit errors per subpage
[  848.249983] mtd_nandbiterrs: Inserted biterror @ 2/6
[  848.254954] mtd_nandbiterrs: rewrite page
[  848.278794] mtd_nandbiterrs: read_page
[  848.282912] mtd_nandbiterrs: Read reported 32 corrected bit errors
[  848.289147] mtd_nandbiterrs: verify_page
[  848.293218] mtd_nandbiterrs: Successfully corrected 8 bit errors per subpage
[  848.300312] mtd_nandbiterrs: Inserted biterror @ 2/5
[  848.305283] mtd_nandbiterrs: rewrite page
[  848.329051] mtd_nandbiterrs: read_page
[  848.333170] mtd_nandbiterrs: Read reported 32 corrected bit errors
[  848.339491] mtd_nandbiterrs: verify_page
[  848.343562] mtd_nandbiterrs: Successfully corrected 9 bit errors per subpage
[  848.350653] mtd_nandbiterrs: Inserted biterror @ 2/2
[  848.355624] mtd_nandbiterrs: rewrite page
[  848.379328] mtd_nandbiterrs: read_page
[  848.383444] mtd_nandbiterrs: Read reported 32 corrected bit errors
[  848.389684] mtd_nandbiterrs: verify_page
[  848.393759] mtd_nandbiterrs: Successfully corrected 10 bit errors per subpage
[  848.400957] mtd_nandbiterrs: Inserted biterror @ 2/0
[  848.405931] mtd_nandbiterrs: rewrite page
[  848.429749] mtd_nandbiterrs: read_page
[  848.433867] mtd_nandbiterrs: Read reported 32 corrected bit errors
[  848.440106] mtd_nandbiterrs: verify_page
[  848.444178] mtd_nandbiterrs: Successfully corrected 11 bit errors per subpage
[  848.451351] mtd_nandbiterrs: Inserted biterror @ 3/7
[  848.456322] mtd_nandbiterrs: rewrite page
[  848.480283] mtd_nandbiterrs: read_page
[  848.484400] mtd_nandbiterrs: Read reported 40 corrected bit errors
[  848.490640] mtd_nandbiterrs: verify_page
[  848.494712] mtd_nandbiterrs: Successfully corrected 12 bit errors per subpage
[  848.501893] mtd_nandbiterrs: Inserted biterror @ 3/6
[  848.506865] mtd_nandbiterrs: rewrite page
[  848.530641] mtd_nandbiterrs: read_page
[  848.534763] mtd_nandbiterrs: Read reported 40 corrected bit errors
[  848.540998] mtd_nandbiterrs: verify_page
[  848.545068] mtd_nandbiterrs: Successfully corrected 13 bit errors per subpage
[  848.552240] mtd_nandbiterrs: Inserted biterror @ 3/5
[  848.557210] mtd_nandbiterrs: rewrite page
[  848.581061] mtd_nandbiterrs: read_page
[  848.585183] mtd_nandbiterrs: Read reported 40 corrected bit errors
[  848.591425] mtd_nandbiterrs: verify_page
[  848.595567] mtd_nandbiterrs: Successfully corrected 14 bit errors per subpage
[  848.602747] mtd_nandbiterrs: Inserted biterror @ 3/2
[  848.607749] mtd_nandbiterrs: rewrite page
[  848.631454] mtd_nandbiterrs: read_page
[  848.635572] mtd_nandbiterrs: Read reported 40 corrected bit errors
[  848.641816] mtd_nandbiterrs: verify_page
[  848.645887] mtd_nandbiterrs: Successfully corrected 15 bit errors per subpage
[  848.653060] mtd_nandbiterrs: Inserted biterror @ 3/0
[  848.658077] mtd_nandbiterrs: rewrite page
[  848.681804] mtd_nandbiterrs: read_page
[  848.685920] mtd_nandbiterrs: Read reported 40 corrected bit errors
[  848.692160] mtd_nandbiterrs: verify_page
[  848.696233] mtd_nandbiterrs: Successfully corrected 16 bit errors per subpage
[  848.703416] mtd_nandbiterrs: Inserted biterror @ 4/2
[  848.708417] mtd_nandbiterrs: rewrite page
[  848.732219] mtd_nandbiterrs: read_page
[  848.736338] mtd_nandbiterrs: Read reported 40 corrected bit errors
[  848.742578] mtd_nandbiterrs: verify_page
[  848.746643] mtd_nandbiterrs: Successfully corrected 17 bit errors per subpage
[  848.753814] mtd_nandbiterrs: Inserted biterror @ 4/0
[  848.758815] mtd_nandbiterrs: rewrite page
[  848.782720] mtd_nandbiterrs: read_page
[  848.786843] mtd_nandbiterrs: Read reported 40 corrected bit errors
[  848.793090] mtd_nandbiterrs: verify_page
[  848.797162] mtd_nandbiterrs: Successfully corrected 18 bit errors per subpage
[  848.804346] mtd_nandbiterrs: Inserted biterror @ 5/7
[  848.809347] mtd_nandbiterrs: rewrite page
[  848.839795] mtd_nandbiterrs: read_page
[  848.843918] mtd_nandbiterrs: Read reported 48 corrected bit errors
[  848.850266] mtd_nandbiterrs: verify_page
[  848.854338] mtd_nandbiterrs: Successfully corrected 19 bit errors per subpage
[  848.862234] mtd_nandbiterrs: Inserted biterror @ 5/2
[  848.867208] mtd_nandbiterrs: rewrite page
[  848.891071] mtd_nandbiterrs: read_page
[  848.895191] mtd_nandbiterrs: Read reported 56 corrected bit errors
[  848.901434] mtd_nandbiterrs: verify_page
[  848.905523] mtd_nandbiterrs: Successfully corrected 20 bit errors per subpage
[  848.912700] mtd_nandbiterrs: Inserted biterror @ 5/0
[  848.917720] mtd_nandbiterrs: rewrite page
[  848.941382] mtd_nandbiterrs: read_page
[  848.945499] mtd_nandbiterrs: Read reported 56 corrected bit errors
[  848.951739] mtd_nandbiterrs: verify_page
[  848.955814] mtd_nandbiterrs: Successfully corrected 21 bit errors per subpage
[  848.962987] mtd_nandbiterrs: Inserted biterror @ 6/6
[  848.967988] mtd_nandbiterrs: rewrite page
[  848.991818] mtd_nandbiterrs: read_page
[  848.995936] mtd_nandbiterrs: Read reported 56 corrected bit errors
[  849.002180] mtd_nandbiterrs: verify_page
[  849.006254] mtd_nandbiterrs: Successfully corrected 22 bit errors per subpage
[  849.013434] mtd_nandbiterrs: Inserted biterror @ 6/2
[  849.018435] mtd_nandbiterrs: rewrite page
[  849.042083] mtd_nandbiterrs: read_page
[  849.046204] mtd_nandbiterrs: Read reported 56 corrected bit errors
[  849.052450] mtd_nandbiterrs: verify_page
[  849.056523] mtd_nandbiterrs: Successfully corrected 23 bit errors per subpage
[  849.063696] mtd_nandbiterrs: Inserted biterror @ 6/0
[  849.068769] mtd_nandbiterrs: rewrite page
[  849.092505] mtd_nandbiterrs: read_page
[  849.096623] mtd_nandbiterrs: Read reported 56 corrected bit errors
[  849.102868] mtd_nandbiterrs: verify_page
[  849.107014] mtd_nandbiterrs: Successfully corrected 24 bit errors per subpage
[  849.114196] mtd_nandbiterrs: Inserted biterror @ 7/7
[  849.119197] mtd_nandbiterrs: rewrite page
[  849.142929] mtd_nandbiterrs: read_page
[  849.147050] mtd_nandbiterrs: Read reported 64 corrected bit errors
[  849.153292] mtd_nandbiterrs: verify_page
[  849.157366] mtd_nandbiterrs: Successfully corrected 25 bit errors per subpage
[  849.164541] mtd_nandbiterrs: Inserted biterror @ 7/6
[  849.169542] mtd_nandbiterrs: rewrite page
[  849.193257] mtd_nandbiterrs: read_page
[  849.197375] mtd_nandbiterrs: Read reported 64 corrected bit errors
[  849.203612] mtd_nandbiterrs: verify_page
[  849.207716] mtd_nandbiterrs: Successfully corrected 26 bit errors per subpage
[  849.214856] mtd_nandbiterrs: Inserted biterror @ 7/2
[  849.219865] mtd_nandbiterrs: rewrite page
[  849.243653] mtd_nandbiterrs: read_page
[  849.247782] mtd_nandbiterrs: Read reported 64 corrected bit errors
[  849.253969] mtd_nandbiterrs: verify_page
[  849.258085] mtd_nandbiterrs: Successfully corrected 27 bit errors per subpage
[  849.265225] mtd_nandbiterrs: Inserted biterror @ 7/0
[  849.270227] mtd_nandbiterrs: rewrite page
[  849.293912] mtd_nandbiterrs: read_page
[  849.298080] mtd_nandbiterrs: Read reported 64 corrected bit errors
[  849.304265] mtd_nandbiterrs: verify_page
[  849.308380] mtd_nandbiterrs: Successfully corrected 28 bit errors per subpage
[  849.315521] mtd_nandbiterrs: Inserted biterror @ 8/7
[  849.320532] mtd_nandbiterrs: rewrite page
[  849.344244] mtd_nandbiterrs: read_page
[  849.348411] mtd_nandbiterrs: error: read failed at 0x0
[  849.353560] mtd_nandbiterrs: After 29 biterrors per subpage, read reported error -74
[  849.361995] mtd_nandbiterrs: finished successfully.
[  849.366881] ==================================================
insmod: ERROR: could not insert module /root/mtd-tests/mtd_nandbiterrs.ko: Input/output error

[root@localhost ~]# insmod /root/mtd-tests/mtd_nandbiterrs.ko dev=1 mode=1
[   35.922802] 
[   35.924334] ==================================================
[   35.937522] mtd_nandbiterrs: MTD device: 1
[   35.947482] mtd_nandbiterrs: MTD device size 67108864, eraseblock=524288, page=4096, oob=224
[   35.955976] mtd_nandbiterrs: Device uses 1 subpages of 4096 bytes
[   35.964375] mtd_nandbiterrs: Using page=0, offset=0, eraseblock=0
[   35.972648] mtd_nandbiterrs: overwrite biterrors test
[   35.979477] mtd_nandbiterrs: write_page
[   42.717080] Adjusting timer_us more than 11% (-1929326461 vs -1967128576)
[   53.673856] mtd_nandbiterrs: Read reported 8 corrected bit errors
[   60.688953] mtd_nandbiterrs: Read reported 16 corrected bit errors
[   63.297015] mtd_nandbiterrs: Read reported 24 corrected bit errors
[   68.312608] mtd_nandbiterrs: Read reported 32 corrected bit errors
[  111.163024] mtd_nandbiterrs: Read reported 40 corrected bit errors
[  123.649406] mtd_nandbiterrs: Read reported 48 corrected bit errors
[  124.034262] mtd_nandbiterrs: Read reported 56 corrected bit errors
[  152.870915] mtd_nandbiterrs: Read reported 64 corrected bit errors
[  158.707376] mtd_nandbiterrs: error: read failed at 0x0
[  158.712790] mtd_nandbiterrs: Read reported error -74
[  158.717932] mtd_nandbiterrs: Bit error histogram (7643 operations total):
[  158.724764] mtd_nandbiterrs: Page reads with   0 corrected bit errors: 1332
[  158.731845] mtd_nandbiterrs: Page reads with   1 corrected bit errors: 0
[  158.738632] mtd_nandbiterrs: Page reads with   2 corrected bit errors: 0
[  158.745319] mtd_nandbiterrs: Page reads with   3 corrected bit errors: 0
[  158.752116] mtd_nandbiterrs: Page reads with   4 corrected bit errors: 0
[  158.758899] mtd_nandbiterrs: Page reads with   5 corrected bit errors: 0
[  158.765586] mtd_nandbiterrs: Page reads with   6 corrected bit errors: 0
[  158.772377] mtd_nandbiterrs: Page reads with   7 corrected bit errors: 0
[  158.779158] mtd_nandbiterrs: Page reads with   8 corrected bit errors: 426
[  158.786018] mtd_nandbiterrs: Page reads with   9 corrected bit errors: 0
[  158.792809] mtd_nandbiterrs: Page reads with  10 corrected bit errors: 0
[  158.799585] mtd_nandbiterrs: Page reads with  11 corrected bit errors: 0
[  158.806272] mtd_nandbiterrs: Page reads with  12 corrected bit errors: 0
[  158.813064] mtd_nandbiterrs: Page reads with  13 corrected bit errors: 0
[  158.819840] mtd_nandbiterrs: Page reads with  14 corrected bit errors: 0
[  158.826527] mtd_nandbiterrs: Page reads with  15 corrected bit errors: 0
[  158.833318] mtd_nandbiterrs: Page reads with  16 corrected bit errors: 213
[  158.840286] mtd_nandbiterrs: Page reads with  17 corrected bit errors: 0
[  158.847088] mtd_nandbiterrs: Page reads with  18 corrected bit errors: 0
[  158.853776] mtd_nandbiterrs: Page reads with  19 corrected bit errors: 0
[  158.860574] mtd_nandbiterrs: Page reads with  20 corrected bit errors: 0
[  158.867355] mtd_nandbiterrs: Page reads with  21 corrected bit errors: 0
[  158.874042] mtd_nandbiterrs: Page reads with  22 corrected bit errors: 0
[  158.880848] mtd_nandbiterrs: Page reads with  23 corrected bit errors: 0
[  158.887629] mtd_nandbiterrs: Page reads with  24 corrected bit errors: 250
[  158.894490] mtd_nandbiterrs: Page reads with  25 corrected bit errors: 0
[  158.901282] mtd_nandbiterrs: Page reads with  26 corrected bit errors: 0
[  158.908062] mtd_nandbiterrs: Page reads with  27 corrected bit errors: 0
[  158.914749] mtd_nandbiterrs: Page reads with  28 corrected bit errors: 0
[  158.921540] mtd_nandbiterrs: Page reads with  29 corrected bit errors: 0
[  158.928814] mtd_nandbiterrs: Page reads with  30 corrected bit errors: 0
[  158.935499] mtd_nandbiterrs: Page reads with  31 corrected bit errors: 0
[  158.942284] mtd_nandbiterrs: Page reads with  32 corrected bit errors: 2587
[  158.949315] mtd_nandbiterrs: Page reads with  33 corrected bit errors: 0
[  158.956000] mtd_nandbiterrs: Page reads with  34 corrected bit errors: 0
[  158.962779] mtd_nandbiterrs: Page reads with  35 corrected bit errors: 0
[  158.969544] mtd_nandbiterrs: Page reads with  36 corrected bit errors: 0
[  158.976230] mtd_nandbiterrs: Page reads with  37 corrected bit errors: 0
[  158.983027] mtd_nandbiterrs: Page reads with  38 corrected bit errors: 0
[  158.989794] mtd_nandbiterrs: Page reads with  39 corrected bit errors: 0
[  158.996480] mtd_nandbiterrs: Page reads with  40 corrected bit errors: 747
[  159.003431] mtd_nandbiterrs: Page reads with  41 corrected bit errors: 0
[  159.010199] mtd_nandbiterrs: Page reads with  42 corrected bit errors: 0
[  159.016967] mtd_nandbiterrs: Page reads with  43 corrected bit errors: 0
[  159.023653] mtd_nandbiterrs: Page reads with  44 corrected bit errors: 0
[  159.030430] mtd_nandbiterrs: Page reads with  45 corrected bit errors: 0
[  159.037195] mtd_nandbiterrs: Page reads with  46 corrected bit errors: 0
[  159.043881] mtd_nandbiterrs: Page reads with  47 corrected bit errors: 0
[  159.050659] mtd_nandbiterrs: Page reads with  48 corrected bit errors: 28
[  159.057511] mtd_nandbiterrs: Page reads with  49 corrected bit errors: 0
[  159.064196] mtd_nandbiterrs: Page reads with  50 corrected bit errors: 0
[  159.070975] mtd_nandbiterrs: Page reads with  51 corrected bit errors: 0
[  159.077742] mtd_nandbiterrs: Page reads with  52 corrected bit errors: 0
[  159.084428] mtd_nandbiterrs: Page reads with  53 corrected bit errors: 0
[  159.091207] mtd_nandbiterrs: Page reads with  54 corrected bit errors: 0
[  159.097972] mtd_nandbiterrs: Page reads with  55 corrected bit errors: 0
[  159.104658] mtd_nandbiterrs: Page reads with  56 corrected bit errors: 1718
[  159.111716] mtd_nandbiterrs: Page reads with  57 corrected bit errors: 0
[  159.118483] mtd_nandbiterrs: Page reads with  58 corrected bit errors: 0
[  159.125168] mtd_nandbiterrs: Page reads with  59 corrected bit errors: 0
[  159.131947] mtd_nandbiterrs: Page reads with  60 corrected bit errors: 0
[  159.138713] mtd_nandbiterrs: Page reads with  61 corrected bit errors: 0
[  159.145398] mtd_nandbiterrs: Page reads with  62 corrected bit errors: 0
[  159.152177] mtd_nandbiterrs: Page reads with  63 corrected bit errors: 0
[  159.158942] mtd_nandbiterrs: Page reads with  64 corrected bit errors: 342
[  159.166394] mtd_nandbiterrs: finished successfully.
[  159.171365] ==================================================


[root@localhost ~]# insmod /root/mtd-tests/mtd_oobtest.ko dev=1
[   81.671222] 
[   81.672889] =================================================
[   81.678647] mtd_oobtest: MTD device: 1
[   81.684113] mtd_oobtest: MTD device size 67108864, eraseblock size 524288, page size 4096, count of eraseblocks 128, pages per eraseblock 128, OOB size 224
[   81.735121] mtd_test: scanning for bad eraseblocks
[   81.739934] mtd_test: scanned 128 eraseblocks, 0 are bad
[   81.745294] mtd_oobtest: test 1 of 5
[   81.826984] mtd_oobtest: writing OOBs of whole device
[   82.012080] mtd_oobtest: written up to eraseblock 0
[   95.693233] mtd_oobtest: written 128 eraseblocks
[   95.697860] mtd_oobtest: verifying all eraseblocks
[   95.784329] mtd_oobtest: verified up to eraseblock 0
[  104.453700] mtd_oobtest: verified 128 eraseblocks
[  104.458408] mtd_oobtest: test 2 of 5
[  104.535594] mtd_oobtest: writing OOBs of whole device
[  104.640800] mtd_oobtest: written up to eraseblock 0
[  118.332306] mtd_oobtest: written 128 eraseblocks
[  118.336935] mtd_oobtest: verifying all eraseblocks
[  118.423385] mtd_oobtest: verified up to eraseblock 0
[  127.075131] mtd_oobtest: verified 128 eraseblocks
[  127.079825] mtd_oobtest: test 3 of 5
[  127.158388] mtd_oobtest: writing OOBs of whole device
[  127.269185] mtd_oobtest: written up to eraseblock 0
[  140.822559] mtd_oobtest: written 128 eraseblocks
[  140.827186] mtd_oobtest: verifying all eraseblocks
[  140.994636] mtd_oobtest: verified up to eraseblock 0
[  158.287402] mtd_oobtest: verified 128 eraseblocks
[  158.292096] mtd_oobtest: test 4 of 5
[  158.369704] mtd_oobtest: attempting to start write past end of OOB
[  158.375884] mtd_oobtest: an error is expected...
[  158.380488] mtd_oobtest: error occurred as expected
[  158.385927] mtd_oobtest: attempting to start read past end of OOB
[  158.392046] mtd_oobtest: an error is expected...
[  158.396679] mtd_oobtest: error occurred as expected
[  158.401552] mtd_oobtest: attempting to write past end of device
[  158.407477] mtd_oobtest: an error is expected...
[  158.412082] mtd_oobtest: error occurred as expected
[  158.416991] mtd_oobtest: attempting to read past end of device
[  158.422809] mtd_oobtest: an error is expected...
[  158.427434] mtd_oobtest: error occurred as expected
[  158.432869] mtd_oobtest: attempting to write past end of device
[  158.438805] mtd_oobtest: an error is expected...
[  158.443411] mtd_oobtest: error occurred as expected
[  158.448295] mtd_oobtest: attempting to read past end of device
[  158.454132] mtd_oobtest: an error is expected...
[  158.458736] mtd_oobtest: error occurred as expected
[  158.463598] mtd_oobtest: test 5 of 5
[  158.540451] mtd_oobtest: writing OOBs of whole device
[  158.546342] mtd_oobtest: written up to eraseblock 0
[  158.552043] mtd_oobtest: written up to eraseblock 0
[  158.767554] mtd_oobtest: written 127 eraseblocks
[  158.772159] mtd_oobtest: verifying all eraseblocks
[  158.778355] mtd_oobtest: verified up to eraseblock 0
[  158.955044] mtd_oobtest: verified 127 eraseblocks
[  158.959737] mtd_oobtest: finished with 0 errors
[  158.964975] =================================================

Lucas Stach (5):
  mtd: nand: tegra: add devicetree binding
  mtd: nand: add NVIDIA Tegra NAND Flash controller driver
  clk: tegra20: init NDFLASH clock to sensible rate
  ARM: tegra: add Tegra20 NAND flash controller node
  ARM: tegra: enable NAND flash on Colibri T20

 .../bindings/mtd/nvidia,tegra20-nand.txt           |  30 +
 MAINTAINERS                                        |   6 +
 arch/arm/boot/dts/tegra20-colibri-512.dtsi         |   7 +
 arch/arm/boot/dts/tegra20.dtsi                     |  13 +
 drivers/clk/tegra/clk-tegra20.c                    |   1 +
 drivers/mtd/nand/Kconfig                           |   6 +
 drivers/mtd/nand/Makefile                          |   1 +
 drivers/mtd/nand/tegra_nand.c                      | 839 +++++++++++++++++++++
 8 files changed, 903 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.txt
 create mode 100644 drivers/mtd/nand/tegra_nand.c

-- 
2.4.3
