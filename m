Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843017;
	b=NrJ1e54NDGyxuKK3GAzullzaeithAIxAC1922YQWh8ddlUxBpVmWOMBaCxVRKOMUiEpb
	 cZ2sKurE3Ls6glAD6zjBU7DJtftumuZ56hpBhuNvDxjx7J0Gy/RVQUXc08uSBgKdHyvJZ
	 YM/OcnESDyP7JzRD+LACRemMKKcF3f8J5z2MfysAk1jDVvTLtRu3exy8xov2Ka2sxHcI1
	 NXBpIavYUYhOgF1CXodRcdPQrScgBDJoeP16daJPE7RervfIsg2NCWPJqPRWn0aa5sOcK
	 DvRd93NVX+MRZ7nN9AMsa0kxWdtr8V9uGaEKYCct+hVhhgQfmBSmmRPphVwTs1SHfJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843017;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=h+kLUNdCVLVssx+7skYztl21dk3oQP7DPiS0iqoevoM=;
	b=yQ7Oi2T1AL5/WlnTTzgehBpEB/0Z8z+h08t19Y7OeiQQ/eFO41/mygcMTibdXBlrBkxc
	 tDeHMkoqWbyYhzvfSrZGSlV8EcyK2QUjCNE8pEUCap/zI66GbaArx+LKmtO9Y4X5DjPbM
	 ZPvE0iTJDzpHEdpLq1zP1NcwOs/sPZ8CdiecFbvcZGRcs68HHZRceYHp9WVDtwjL9Dzlb
	 5ZB0tijkttXpjWEiPem/UOu99wmSMdVu8wmrkNkdZs+juwN4R7r9ZH5kRDJAH4ofnHHTk
	 gYXdNr1wr5KfuJHiKbtxypJ6F/3l40E7XD2u3KsvTTwkobWBF0yVMNDvhMQLVVLyscA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iH9TBdIq;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CE4606A88F;
	Mon, 16 Nov 2026 15:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15CE4606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iH9TBdIq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 35798C4EFE1;
	Mon, 16 Nov 2026 15:30:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 08A37603BF;
	Mon, 16 Nov 2026 15:30:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3EDA11BC05B3;
	Mon, 16 Nov 2026 16:29:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794843007; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h+kLUNdCVLVssx+7skYztl21dk3oQP7DPiS0iqoevoM=;
	b=iH9TBdIqZlSkdOYhgLebc/ahFWvE4iAmulAHMvpFdDxGMv8OkptqUI9FVtZpvBEpkElEex
	Ern90RxHw+cVIwSmaIgaLC0r0M7LudT9KXEFwVYbc76TpRPm+lStS9eN/2INACzOnWoEGp
	65S1D4BQhb0Mb4OI8rPfyy3VNYqlvPTimEXsumHvb8nWUqgNSHfMp4oTAEqTZDGd9Sf9bV
	URyQdsaMATsPrL7CYYXidboFHSDpmc/yQIGXlT+Po+8ybxMcMMZRHpvEootxn9RNnwxzxI
	pFom6uPxX134uBBQXodODAOQyyHNxz0wtEaoEbQ8bOUnLIJ8GfPY5IR5yn0PNw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Srinivas Kandagatla <srini@kernel.org>,
  Tze Yee Ng <tze.yee.ng@altera.com>,  Richard Cochran
 <richardcochran@gmail.com>,  Jonathan Lemon <jonathan.lemon@gmail.com>,
  Vadim Fedorenko <vadim.fedorenko@linux.dev>,  Yuqiang Sun
 <izaiahsun@gmail.com>,  Amit Kumar Mahapatra
 <amit.kumar-mahapatra@amd.com>,  Luca Ceresoli
 <luca.ceresoli@bootlin.com>,  Bernhard Frauendienst
 <kernel@nospam.obeliks.de>,  "Gustavo A. R. Silva"
 <gustavoars@kernel.org>,  Kees Cook <kees@kernel.org>,
  linux-hardening@vger.kernel.org,  Arseniy Krasnov
 <AVKrasnov@sberdevices.ru>,  Boris Brezillon <bbrezillon@kernel.org>,
  Brian Norris <computersforpeace@gmail.com>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  Samuel Holland <samuel@sholland.org>,
  Chen-Yu Tsai <wens@kernel.org>,  David Woodhouse <dwmw2@infradead.org>,
  Thomas Gleixner <tglx@kernel.org>,  Vitaly Wool <vitalywool@gmail.com>,
  David Woodhouse <David.Woodhouse@intel.com>,  Russell King
 <rmk+kernel@arm.linux.org.uk>,  Mike Rapoport <rppt@kernel.org>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,  Christophe Kerello
 <christophe.kerello@st.com>,  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Jason Roberts <jason.e.roberts@intel.com>,  Boris Brezillon
 <boris.brezillon@collabora.com>,  Michal Simek <michal.simek@amd.com>,
  Mason Yang <masonccyang@mxic.com.tw>,  Ramuthevar Vadivel Murugan
 <vadivel.muruganx.ramuthevar@linux.intel.com>,  Lucas Stach
 <dev@lynxeye.de>,  Dmitry Osipenko <digetx@gmail.com>,  Jonathan Hunter
 <jonathanh@nvidia.com>,  linux-tegra@vger.kernel.org,  Stefan Agner
 <stefan@agner.ch>,  Thierry Reding <thierry.reding@kernel.org>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  linux-mediatek@lists.infradead.org,  Matthias Brugger
 <matthias.bgg@gmail.com>,  Heiko Stuebner <heiko@sntech.de>,
  linux-rockchip@lists.infradead.org,  Yifeng Zhao
 <yifeng.zhao@rock-chips.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Keguang Zhang <keguang.zhang@gmail.com>,  linux-mips@vger.kernel.org,
  Shan-Chun Hung <schung@nuvoton.com>,  Jacky Huang <ychuang3@nuvoton.com>,
  Fabio Estevam <festevam@gmail.com>,  Frank Li <Frank.Li@nxp.com>,
  imx@lists.linux.dev,  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Sascha Hauer <s.hauer@pengutronix.de>,  Han Xu <han.xu@nxp.com>,
  linux-renesas-soc@vger.kernel.org,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  Jerome Brunet <jbrunet@baylibre.com>,
  Kevin Hilman <khilman@baylibre.com>,  Liang Yang
 <liang.yang@amlogic.com>,  linux-amlogic@lists.infradead.org,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  linux-arm-msm@vger.kernel.org,  Manivannan
 Sadhasivam <mani@kernel.org>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Kamal Dasu
 <kamal.dasu@broadcom.com>,  Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,  Paul Cercueil
 <paul@crapouillou.net>,  Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: [PATCH v5 00/58] mtd: rawnand: retain chip and controller state
 across removal
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
	(James Hilliard's message of "Sun, 15 Nov 2026 23:29:15 -0700")
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 16:29:38 +0100
Message-ID: <87fqx0rdzx.fsf@bootlin.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

James,

If I may, I already told you how hard, difficult and painful it was to
review your 100% LLM generated patches.

The past 2 weeks, while I was off, you litteraly bombed me with not less
than 379 patches.

Please, stop.

Thanks,
Miqu=C3=A8l

On 15/11/2026 at 23:29:15 -07, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> An MTD handle can outlive controller unbind. Its metadata and NAND locks
> must remain valid, including when a writable file closes and calls sync,
> while further hardware access must be rejected after disconnection.
>
> This builds on earlier MTD removal-lifetime work. Commit 19bfa9ebebb5
> ("mtd: use refcount to prevent corruption") added MTD reference counting
> [0], but retaining an MTD reference does not by itself retain the
> driver-owned allocation containing the master. The read/unbind discussion
> also covered raw NAND [1] and draining active operations [2]. Tze Yee Ng's
> SPI-NOR series addresses the corresponding SPI-NOR paths [3].
>
> Following Greg's review [7], separate class-device data from the MTD
> backing allocation. Delete the device's interfaces and drain NVMEM and
> class PM callbacks before releasing backing data. Bare device references
> retain an independently allocated device, whose type, PM dispatch and
> final release are built in even when MTD is modular. NVMEM similarly
> disconnects and drains provider and layout callbacks before unregister
> returns; retained consumers keep core-owned metadata and receive -ENODEV
> on subsequent access.
>
> Introduce opt-in backing-object ownership for MTD masters. Registered
> nodes and acquired MTD handles retain the chip, while nested partitions
> also retain their parent metadata. Unregister first so removal notifiers
> can finish I/O, then disconnect raw NAND and drain admitted operations.
> Hardware resources can be released without waiting for open files to clos=
e.
>
> Virtual concatenations serialize publication and removal across physical
> controllers. Disconnect and drain a published concatenation before any
> component can disappear, then release its component references. An old
> handle keeps the disconnected virtual device, independently of a later
> replacement.
>
> Run NAND and controller-specific cleanup during disconnection, while
> the controller driver is still bound. Snapshot the OOB layout in core-own=
ed
> data before publication so metadata queries remain valid without driver
> callbacks. The NAND core frees retained chip and controller allocations;
> the final MTD put never calls back into the controller module. Ordinary
> MTD and NVMEM handles retain the NAND core that implements their
> operations, rather than the hardware driver.
>
> Share allocation ownership across the raw-NAND drivers, including
> partially published probes. Shared controllers remain allocated until
> their last retained chip is released. R852 allocates a new chip for each
> card, and NDFC allocates controller state per binding.
>
> Based on NAND next at 30daaf3e7897, with Tze Yee Ng's module-reference
> ordering fix [4], Karl Mehltretter's OTP cleanup fix [6], and the separat=
ely
> posted registration, operation-locking and controller probe/teardown fixes
> identified by the prerequisite metadata. TLA+ models and their assumptions
> and coverage limits are available in [5].
>
> [0] https://lore.kernel.org/r/20230620131905.648089-2-alexander.usyskin@i=
ntel.com
> [1] https://lore.kernel.org/r/CAND4H7dz94Gsi_tXSQmLNme9uROnouOUwuCX9BW_+R=
Cc2ZFDqA@mail.gmail.com
> [2] https://lore.kernel.org/r/mafs0bjs73tbq.fsf@kernel.org
> [3] https://lore.kernel.org/r/20261022035352.52129-1-tze.yee.ng@altera.com
> [4] https://lore.kernel.org/r/20261022035352.52129-2-tze.yee.ng@altera.com
> [5] https://github.com/jameshilliard/linux-h616-nand-tla
> [6] https://lore.kernel.org/r/20260816163027.10044-1-kmehltretter@gmail.c=
om
> [7] https://lore.kernel.org/r/2026111037-stir-hermit-cb21@gregkh
>
> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes in v5:
> - Use logical MTD registration state during unregister and failed
>   registration cleanup, independently of retained class devices.
> - Pass the master to provider get hooks, matching the put hooks.
> - Preserve sibling partitions when a child is removed during parsing,
>   and limit subpartition rollback to its parent.
> - Add the introducing Fixes tag for the Technologic node ownership
>   correction and collect Wolfram's Renesas Acked-by.
> - Link to v4: https://patch.msgid.link/20261113-submit-rawnand-retained-h=
andle-lifetime-v1-v4-0-556b1d7c6221@gmail.com
>
> Changes in v4:
> - Keep MTD subdirectories behind CONFIG_MTD so boolean child options
>   do not become built-in users of a modular MTD core.
> - Serialize partition publication with deletion and retain a handle
>   while parsing subpartitions. Reject children of removed partitions.
> - Distinguish explicit NULL NVMEM owners from the parent-module
>   fallback, including OTP providers backed by built-in NAND code.
> - Register layout-owned cells explicitly, preserving provider cells
>   added before or after a layout binds.
> - Rebuild cell attributes across layout bind/unbind, free partial
>   allocations on failure and remove attributes before device deletion.
> - Pair NVMEM_REMOVE notifications only with successful NVMEM_ADD
>   notifications and remove the redundant disconnected-device check.
> - Resolve concatenation OOB layouts through the first component's
>   master, including partition-backed components.
> - Link to v3: https://patch.msgid.link/20261111-submit-rawnand-retained-h=
andle-lifetime-v1-v3-0-ce537999741d@gmail.com
>
> Changes in v3:
> - Finish NAND and driver cleanup during disconnection, leaving final
>   allocation release in the NAND core, following Greg's networking exampl=
e.
> - Snapshot OOB layouts before publication and drain complete BBM/BBT
>   updates before releasing their working state.
> - Separate MTD class-device allocation and final release from backing-obj=
ect
>   ownership, following Greg's review.
> - Drain class PM callbacks under the device lock before detaching backing
>   data; keep device-type and PM dispatch storage with the built-in device.
> - Drain NVMEM provider and layout callbacks during unregister, retaining
>   core-owned metadata for old consumers and retiring cells across rebind.
> - Keep NVMEM consumer-owner references, with converted raw NAND
>   providers naming the NAND core instead of the controller module.
>   Release write-protect GPIOs once provider callbacks are drained.
> - Acquire an MTD handle for PTP OCP firmware updates through a class devi=
ce.
> - Drain concatenation operations before releasing components, including
>   concurrent removal of masters without opt-in lifetime ownership.
> - Use scoped cleanup consistently in Tegra probe and add the introducing
>   commits for Socrates and FSL UPM, following Sashiko's review.
> - Link to v2: https://patch.msgid.link/20261110-submit-rawnand-retained-h=
andle-lifetime-v1-v2-0-9137d08f05df@gmail.com
>
> Changes in v2:
> - Keep the MTD device callback owner pinned through callback return,
>   with the final module put performed by the device core.
> - Retain virtual-concat components across removal and rebind, serialize
>   staging/publication and unwind incomplete partition registrations.
> - Balance Tegra's probe-time child-node reference separately from the
>   reference retained for the chip lifetime.
> - Refresh the prerequisite stack to the separately posted fixes, using
>   the latest QCOM child-probe revision.
> - Keep the lifetime changes on top of those fixes: preserve QCOM scan
>   before publication, R852 per-card initialization and Intel probe
>   hardware shutdown.
> - Fold Macronix disconnection handling into the NAND disconnect patch;
>   its operation locking is supplied by the posted prerequisite.
> - Use Karl Mehltretter's posted OTP cleanup fix as a prerequisite in
>   place of the duplicate preparatory patch.
> - Keep the NVMEM context callback module pinned until its final callback
>   returns, independently of the provider's consumer owner.
> - Use the posted fixes for dynamic partition publication and partition-no=
de
>   ownership. Keep master get/put accounting independent of
>   later master registration in the MTD ownership patch.
> - Propagate disconnection through BBT error recovery without marking
>   the eraseblock bad.
> - Make suspend of a disconnected, retained NAND device a no-op.
> - Handle R852 card events during removal while preventing new work from
>   being queued.
> - Initialize Denali and Atmel cleanup variables at allocation and add
>   the introducing-commit trailers for Orion and MPC5121.
> - Link to v1: https://patch.msgid.link/20261107-submit-rawnand-retained-h=
andle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com
>
> To: Miquel Raynal <miquel.raynal@bootlin.com>
> To: Richard Weinberger <richard@nod.at>
> To: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
>
> ---
> James Hilliard (58):
>       nvmem: disconnect provider callbacks before unregister returns
>       mtd: acquire an MTD handle from a referenced class device
>       mtd: separate class devices from retained backing objects
>       mtd: retain virtual concatenations across component removal
>       mtd: rawnand: separate hardware disconnection from cleanup
>       mtd: rawnand: share retained chip and controller ownership
>       mtd: rawnand: sunxi: retain chip state until the final MTD put
>       mtd: rawnand: plat_nand: retain open-handle state on removal
>       mtd: rawnand: gpio: retain open-handle state on removal
>       mtd: rawnand: stm32_fmc2: retain open-handle state on removal
>       mtd: rawnand: denali: retain chips across controller removal
>       mtd: rawnand: arasan: retain chips across controller removal
>       mtd: rawnand: mxic: retain open-handle state on removal
>       mtd: rawnand: intel: retain open-handle state on removal
>       mtd: rawnand: tegra: retain open-handle state on removal
>       mtd: rawnand: mtk: retain chips across controller removal
>       mtd: rawnand: rockchip: retain chips across controller removal
>       mtd: rawnand: atmel: retain chips across controller removal
>       mtd: rawnand: orion: retain open-handle state on removal
>       mtd: rawnand: socrates: retain open-handle state on removal
>       mtd: rawnand: fsl_upm: retain open-handle state on removal
>       mtd: rawnand: pasemi: retain open-handle state on removal
>       mtd: rawnand: ams-delta: retain open-handle state on removal
>       mtd: rawnand: xway: retain open-handle state on removal
>       mtd: rawnand: hisi504: retain open-handle state on removal
>       mtd: rawnand: vf610: retain open-handle state on removal
>       mtd: rawnand: technologic: retain open-handle state on removal
>       mtd: rawnand: loongson: retain open-handle state on removal
>       mtd: rawnand: ma35d1: retain open-handle state on removal
>       mtd: rawnand: pl35x: retain open-handle state on removal
>       mtd: rawnand: mxc: retain open-handle state on removal
>       mtd: rawnand: fsmc: retain open-handle state on removal
>       mtd: rawnand: gpmi: retain open-handle state on removal
>       mtd: rawnand: omap2: retain open-handle state on removal
>       mtd: rawnand: marvell: retain open-handle state on removal
>       mtd: rawnand: renesas: retain open-handle state on removal
>       mtd: rawnand: meson: retain open-handle state on removal
>       mtd: rawnand: cadence: retain open-handle state on removal
>       mtd: rawnand: qcom: retain open-handle state on removal
>       mtd: rawnand: cafe: retain open-handle state on removal
>       mtd: rawnand: brcmnand: retain open-handle state on removal
>       mtd: rawnand: au1550nd: retain chip state across removal
>       mtd: rawnand: sharpsl: retain chip state across removal
>       mtd: rawnand: davinci: retain chip state across removal
>       mtd: rawnand: sh_flctl: retain chip state across removal
>       mtd: rawnand: lpc32xx_slc: retain chip state across removal
>       mtd: rawnand: lpc32xx_mlc: retain chip state across removal
>       mtd: rawnand: ndfc: retain chip state across removal
>       mtd: rawnand: txx9ndfmc: retain chip state across removal
>       mtd: rawnand: ingenic: retain chip state across removal
>       mtd: rawnand: mpc5121: retain chip state across removal
>       mtd: rawnand: bcm47xxnflash: retain chip state across removal
>       mtd: rawnand: fsl_elbc: retain chip state across removal
>       mtd: rawnand: fsl_ifc: retain chip state across removal
>       mtd: rawnand: r852: retain chip state across removal
>       mtd: rawnand: nandsim: retain chip state across removal
>       mtd: rawnand: cs553x: retain chip state across removal
>       mtd: rawnand: diskonchip: retain chip state across removal
>
>  drivers/Makefile                                   |   2 +-
>  drivers/media/pci/cobalt/cobalt-flash.c            |   2 +-
>  drivers/mtd/Kconfig                                |   5 +
>  drivers/mtd/Makefile                               |   5 +-
>  drivers/mtd/devices/bcm47xxsflash.c                |   2 +-
>  drivers/mtd/devices/docg3.c                        |   4 +-
>  drivers/mtd/devices/mchp23k256.c                   |   2 +-
>  drivers/mtd/devices/mchp48l640.c                   |   2 +-
>  drivers/mtd/devices/mtd_dataflash.c                |   2 +-
>  drivers/mtd/devices/mtd_intel_dg.c                 |  30 +-
>  drivers/mtd/devices/powernv_flash.c                |   4 +-
>  drivers/mtd/devices/spear_smi.c                    |   2 +-
>  drivers/mtd/devices/sst25l.c                       |   2 +-
>  drivers/mtd/devices/st_spi_fsm.c                   |   8 +-
>  drivers/mtd/hyperbus/hyperbus-core.c               |   2 +-
>  drivers/mtd/lpddr/lpddr2_nvm.c                     |   2 +-
>  drivers/mtd/maps/lantiq-flash.c                    |   2 +-
>  drivers/mtd/maps/physmap-core.c                    |   2 +-
>  drivers/mtd/maps/plat-ram.c                        |   2 +-
>  drivers/mtd/maps/pxa2xx-flash.c                    |   2 +-
>  drivers/mtd/maps/sa1100-flash.c                    |   2 +-
>  drivers/mtd/maps/vmu-flash.c                       |   2 +-
>  drivers/mtd/mtd_blkdevs.c                          |   2 +-
>  drivers/mtd/mtd_virt_concat.c                      | 526 +++++++++++----=
------
>  drivers/mtd/mtdconcat.c                            | 103 +++-
>  drivers/mtd/mtdcore.c                              | 308 +++++++-----
>  drivers/mtd/mtdcore.h                              |   5 +
>  drivers/mtd/mtddevice.c                            |  59 +++
>  drivers/mtd/mtddevice.h                            |  12 +
>  drivers/mtd/mtdpart.c                              |  68 ++-
>  drivers/mtd/mtdpstore.c                            |  50 +-
>  drivers/mtd/nand/ecc.c                             |   3 +-
>  drivers/mtd/nand/onenand/generic.c                 |   2 +-
>  drivers/mtd/nand/onenand/onenand_omap2.c           |   2 +-
>  drivers/mtd/nand/onenand/onenand_samsung.c         |   2 +-
>  drivers/mtd/nand/raw/Makefile                      |   1 +
>  drivers/mtd/nand/raw/ams-delta.c                   |  28 +-
>  drivers/mtd/nand/raw/arasan-nand-controller.c      |  49 +-
>  drivers/mtd/nand/raw/atmel/nand-controller.c       |  44 +-
>  drivers/mtd/nand/raw/au1550nd.c                    |  23 +-
>  drivers/mtd/nand/raw/bcm47xxnflash/main.c          |  18 +-
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c           |  65 ++-
>  drivers/mtd/nand/raw/cadence-nand-controller.c     |  51 +-
>  drivers/mtd/nand/raw/cafe_nand.c                   |  27 +-
>  drivers/mtd/nand/raw/cs553x_nand.c                 |  44 +-
>  drivers/mtd/nand/raw/davinci_nand.c                |  26 +-
>  drivers/mtd/nand/raw/denali.c                      |  28 +-
>  drivers/mtd/nand/raw/denali_dt.c                   |  13 +-
>  drivers/mtd/nand/raw/denali_pci.c                  |   9 +-
>  drivers/mtd/nand/raw/diskonchip.c                  |  17 +-
>  drivers/mtd/nand/raw/fsl_elbc_nand.c               |  56 ++-
>  drivers/mtd/nand/raw/fsl_ifc_nand.c                |  48 +-
>  drivers/mtd/nand/raw/fsl_upm.c                     |  20 +-
>  drivers/mtd/nand/raw/fsmc_nand.c                   |  19 +-
>  drivers/mtd/nand/raw/gpio.c                        |  18 +-
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c         |  19 +-
>  drivers/mtd/nand/raw/hisi504_nand.c                |  20 +-
>  drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c    |  41 +-
>  drivers/mtd/nand/raw/intel-nand-controller.c       |  20 +-
>  drivers/mtd/nand/raw/internals.h                   |   2 +-
>  drivers/mtd/nand/raw/loongson-nand-controller.c    |  21 +-
>  drivers/mtd/nand/raw/lpc32xx_mlc.c                 |  38 +-
>  drivers/mtd/nand/raw/lpc32xx_slc.c                 |  40 +-
>  drivers/mtd/nand/raw/marvell_nand.c                |  46 +-
>  drivers/mtd/nand/raw/meson_nand.c                  |  49 +-
>  drivers/mtd/nand/raw/mpc5121_nfc.c                 |  26 +-
>  drivers/mtd/nand/raw/mtk_nand.c                    |  40 +-
>  drivers/mtd/nand/raw/mxc_nand.c                    |  23 +-
>  drivers/mtd/nand/raw/mxic_nand.c                   |  23 +-
>  drivers/mtd/nand/raw/nand_base.c                   | 103 +++-
>  drivers/mtd/nand/raw/nand_bbt.c                    |  24 +-
>  drivers/mtd/nand/raw/nand_lifetime.c               | 246 ++++++++++
>  drivers/mtd/nand/raw/nand_macronix.c               |   8 +-
>  drivers/mtd/nand/raw/nand_onfi.c                   |   4 +-
>  drivers/mtd/nand/raw/nandsim.c                     |  21 +-
>  drivers/mtd/nand/raw/ndfc.c                        |  34 +-
>  .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  |  42 +-
>  drivers/mtd/nand/raw/omap2.c                       |  27 +-
>  drivers/mtd/nand/raw/orion_nand.c                  |  24 +-
>  drivers/mtd/nand/raw/pasemi_nand.c                 |  22 +-
>  drivers/mtd/nand/raw/pl35x-nand-controller.c       |  38 +-
>  drivers/mtd/nand/raw/plat_nand.c                   |  20 +-
>  drivers/mtd/nand/raw/qcom_nandc.c                  |  39 +-
>  drivers/mtd/nand/raw/r852.c                        | 111 +++--
>  drivers/mtd/nand/raw/r852.h                        |   1 +
>  drivers/mtd/nand/raw/renesas-nand-controller.c     |  37 +-
>  drivers/mtd/nand/raw/rockchip-nand-controller.c    |  45 +-
>  drivers/mtd/nand/raw/sh_flctl.c                    |  22 +-
>  drivers/mtd/nand/raw/sharpsl.c                     |  22 +-
>  drivers/mtd/nand/raw/sm_common.c                   |  15 +-
>  drivers/mtd/nand/raw/sm_common.h                   |   2 +-
>  drivers/mtd/nand/raw/socrates_nand.c               |  19 +-
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c             |  19 +-
>  drivers/mtd/nand/raw/sunxi_nand.c                  |  46 +-
>  drivers/mtd/nand/raw/technologic-nand-controller.c |  22 +-
>  drivers/mtd/nand/raw/tegra_nand.c                  |  27 +-
>  drivers/mtd/nand/raw/txx9ndfmc.c                   |  41 +-
>  drivers/mtd/nand/raw/vf610_nfc.c                   |  20 +-
>  drivers/mtd/nand/raw/xway_nand.c                   |  24 +-
>  drivers/mtd/nand/spi/core.c                        |   2 +-
>  drivers/mtd/nand/spi/esmt.c                        |   2 +-
>  drivers/mtd/nand/spi/micron.c                      |   4 +-
>  drivers/mtd/nand/spi/otp.c                         |   2 +-
>  drivers/mtd/spi-nor/core.c                         |   2 +-
>  drivers/mtd/ubi/build.c                            |   2 +-
>  drivers/nvmem/Kconfig                              |   1 +
>  drivers/nvmem/core.c                               | 463 ++++++++++++---=
---
>  drivers/nvmem/internals.h                          |  16 +-
>  drivers/nvmem/layouts.c                            |   2 +
>  drivers/nvmem/layouts/fixed-layout.c               |   2 +-
>  drivers/nvmem/layouts/onie-tlv.c                   |  20 +-
>  drivers/nvmem/layouts/sl28vpd.c                    |   3 +-
>  drivers/nvmem/layouts/u-boot-env.c                 |  25 +-
>  drivers/ptp/ptp_ocp.c                              |   7 +-
>  include/linux/mtd/concat.h                         |  22 +-
>  include/linux/mtd/mtd.h                            |  21 +-
>  include/linux/mtd/rawnand.h                        |  37 +-
>  include/linux/nvmem-provider.h                     |  16 +-
>  118 files changed, 2751 insertions(+), 1265 deletions(-)
> ---
> base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git na=
nd/next
> change-id: 20261104-submit-rawnand-retained-handle-lifetime-v1-0b4225e5ce=
0b
> prerequisite-patch-id: a51b9cb4077105499133c413d58c7ad21d973b38
> prerequisite-patch-id: b3679cda4dcb45ce7712bffe2dd0576b254df44d
> prerequisite-patch-id: 07b5c70e44ad951d20eea9478c98fda35ec765c0
> prerequisite-patch-id: abea50275922fe359d72ca4de5cbc211b04bbd57
> prerequisite-patch-id: 57776b214ffb0331319f024412f21d35e4ca9056
> prerequisite-patch-id: 09be2baaffe1f053704263cc4b0d39f2faa4f49c
> prerequisite-patch-id: c3ad85600dc897ac310be450d8daa2275fb91ee6
> prerequisite-patch-id: 4a85600553ddcc7db5a9537efd905a71cd623f65
> prerequisite-patch-id: 579990ee4a49297efc5a593b00efb9cd73fa15e8
> prerequisite-patch-id: 2ee61a8a32fd147d52e0f9d03758634912d8bfef
> prerequisite-patch-id: 1487df8ce8e6c48471fd77c7470ce9de582dfe3c
> prerequisite-patch-id: 5ecbe86f928d9c5c0bf2cb6065c5672708511fc4
> prerequisite-patch-id: ac68e9b65d3aa5661bd7ac0f2e77dcf5c75fcfe0
> prerequisite-patch-id: e70f0f0c4d430d416a3ad848b37ffad16bd7df07
> prerequisite-patch-id: 05adcddbc50f745ee2640b8c21f3bf76a217f249
> prerequisite-patch-id: 0b60b7ab6196076f327c919be5e7b8bb2051ee12
>
> Best regards,
