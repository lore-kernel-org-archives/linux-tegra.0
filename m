Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446914;
	b=Mqx4A9xYbToXc7ZJpGf13uHsfgVKNBrz2DoyziVGTWUsPyvG2gUWzA3rcz6AkiGZmPwd
	 vqW9ygxVYof0q6RlGPiz3lm8hvoBHJuy8nIq/m8HDepdg/rDB+Iqr4CMFds7tA4Fhjutx
	 ZcSckYEYVfIYkEQcGasENwaCoGPENOX+PNyOaiaCux0XXg+KKkCHA+g9r7YX7egunhiWf
	 Z9gPApAP64qdGDETl/1XCi3KxVw7g8eZ2p55Z5rYtd8gjfx/tT38fahPEm/JvNTWwyfhT
	 995EQDx1vaOsRQZfpuqEtNWXrDVV1kif5kKOEyz19cf2ThhT/j/f7F/tizSDXtH8r3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=xCQ+xgOSS4fWYn2EvpeymfTXMCSacOodab2eJV2wT0s=;
	b=vAP0BX753HujC6PpI6JXGTAqQvgguXiYQmadxa4thgDpD+BfHp6Vp5e9+wvb30WB8HRx
	 q3YP0JOFacn1ll1itr88Oh09X1NR/T+VJzKlDcMfjANzwWXRnttQE2aXXW8ItPj39Y2EJ
	 23MAF1EiiuH+636EY4hjSeCAhETtK0TiEA/Dt+FFEC2xkC9mWJbqq5ADIzguAAYKG8BbC
	 S0UvHbUZVTBN/Q965OajxUPj0+yHgvsxwJfKTigzlXTMwPLI3EgtK+JY35+CgodMM9QXF
	 SvEL1NRseuGoUsxJwHIjRZpQXKmw+ZTVueS1RQl2QPN1sVwHRJkwPd+SO2X2CC1H2Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XNlP88je;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69784606A881
	for <linux-tegra@vger.kernel.org>; Thu, 12 Nov 2026 01:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69784606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XNlP88je
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8470d7d430fso1931671a34.3
        for <linux-tegra@vger.kernel.org>; Wed, 11 Nov 2026 17:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446912; x=1795051712; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xCQ+xgOSS4fWYn2EvpeymfTXMCSacOodab2eJV2wT0s=;
        b=XNlP88jelEdka2EoaEc8z0kfLm3QN1VsJl1LBP4QCa8EYa/+mHyj0jlnlhA+apa+1c
         xZ6eOwKaqZgK2DO0ZGTUL3D3n7NhYbRCDxJp7MNZKNvPm2K3bm+qNT4Q1jzbTjh4Ppmy
         vhEDfWitAHUmw19oEl16m/GFOIECJhKyAtcocLhP8H17HKNvvLoSGVuyqF7/pz89ssIh
         ZYpgAAtqXaHHUdafJDffAaOaKcKkNgvQmebFE7QJE9atRgXuZVHZbS15uYRT/u4gHOJE
         VcYLzaZbzcNt9xP8TLKcvjt0oiHJG05ufOr4zTiMnqDOPV2kTcM55TfV9A4LD+q5R7J6
         C4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446912; x=1795051712;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xCQ+xgOSS4fWYn2EvpeymfTXMCSacOodab2eJV2wT0s=;
        b=vEs7phY0vuMWt3w++xqyiYLkK5Dh2YcpEanNeKpE6tWhCX+mToED+dyUUOCpFRPHkB
         bvrL7ubj/3TzV+TXND8CjeNc1bnHqxbHnQWqZW1nAHeBaTOwDlU+ZtsrE6f00RWY8LxG
         D7TWN8EkCVIPED6u/6nDVsuebRf4zw0boN4lC462OLn4H2gu5kI4X1A9WJ5C8MfAv53I
         robSRlhR/40JHA7Ip/1kYsodGVi1sLPlEjMxdv3TMRKwDtAyi9SBTuGmDV2YlF8eiEcq
         RYYuZcTxLbuWykTYoDo/e4VnztxFTMVt1DwpvHhOrcumpr9YWApJQ6J0Qa1fWUaTheXX
         wE8w==
X-Forwarded-Encrypted: i=1; AL+hErHyhpymvR9zd2siWtPiQhW7mQMMe5qUALYg/aEflcPlEoCUStosCc1E6WXT1J3bMpzO9t+Fnrz7C4HIvQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9VVdbZBHpeSQ3LWVjP0FJZCRj7G4ucWrtpoGK6rwTJvbr2UdUm
	6rLkIu+lO1WyPFS/Ee20cVvSi3/gj2eXzEJI2lC3Ay9xo9F5rUxIqH4E
X-Gm-Gg: AYBFou221lz/uQwu1l95qro4TDMMj5jyMbaHA+uG4QVjjbAOFDYQaTyw6ciivpM1fSc
	8bA06rIOA4wyUlgRstknyHesRFjsm+K2pmRNsu2Eb2L02WmeizEt853bneQBmP+Z8jdaQfw8UAL
	6rCvhf/Jp+IJwGoAzgOSDkhOWLbFfUn4e+W5yg0KIxoUtpwDZ9NLNLMRQcsKaI8oKy4A8Y7x9Pa
	8++JRwrjAXtGfv2bkVEGu52b3mNjgobR9Le0dQsZJYQqRGMAwy0xDBpeYqpPwIi+hui3fECUzux
	zrPCj0UloXz4RzvBv8xoZeTtw6iLUN2Ip7COUwESvvbqFdkZclJnjIdxhAS9DVG1ENlgSXCahrj
	RGp7rllCcLATXJaYJDZCEw8WRiOEtkQs59odr5ZJZjtFcsk6S5Tftjix0xm5ldYywraejNU4qzF
	gPppZCyhjQ0p7N9NFg+Cw76fyqXe00HeDF4dgJsbSxSqNeOhzTZmCvJMJJQRDVOsakpMfISD7QC
	MZu6QXTMNf4L9XrLQGo5ceXa0ZuIhG95So7Jh4xqWamnVoi7s+RyK8gfXesQwoyUjb2OY5duKTt
	8VovlPx8ntngpM5B72NA8G958MTeU3T3xaaV22tU5GisTbAnievSBQqYb76YFIocxF2tCnuWfVk
	jEevK2FQSbOspukz1HTvgMba6CxBTf+xyXwybAP0ctEf7Wgo5kBlxKCv7cUmX8FKxNVUNUtq3Tx
	cANo12EaxIjkk7DuwYnKd+g5ZkwdytHE4N0bSgsorE0h5pzVJtFxgE
X-Received: by 2002:a05:6808:4f67:b0:53c:5052:ea07 with SMTP id 5614622812f47-56b92b4d335mr4376309b6e.5.1794446907584;
        Wed, 11 Nov 2026 17:28:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 00/58] mtd: rawnand: retain chip and controller state
 across removal
Date: Wed, 11 Nov 2026 18:27:39 -0700
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5VUzY6bNwx8lYXP/QqKokQpp75H0YP4l/2KXW9qO
 5sUwb57aScosr4FOgngcEjOkN8OZz/tfj58ePh2OPnrft5fjvmpvz0c9HEdP/q2W/4PCNhLAdr
 On+V5v2yn9eW4jrad/LL2o9uWwfbk29MeftmffXstGwghNm/qIIdM+OnksX+9kf351/d/Zvvb9
 XJl+BFx8n8+ZxWX72GHT+uij1nDh4fVikwVAuYCjeYstSqVam0oL8Nik6vUccvzP0pq56m2yBK
 alSQYJcLRDBp3wUYWRPYeBSxNGZxo2WzFENzXJB46R9iqzZV7U3iPWuKrAXKbiOG1TWPUZM4Ji
 GIpAiRijd+jGvO1jkIRArWWWmYAEhWM7CmpSNeE1u8qnOIoa2UrJaBVBsJeVUnA6gyMtSho6nu
 U1mWjdQDTMXlpLSBODWzYWpiVh8zifsdF64ZprZqpsklbMxk9LOtaXNQ61ujtvq85Z86NFk2cG
 a1ttVkFwJNFjWus0vxOL0z2ssaqGFaIraFDTIPKbfRKs6ANCY/3qEKDLYb68K40iEsYszIxqM8
 UYKClInfTSBXFR4+Jw6amnBKo0iGVbZ2RYbRSQulOZe3Dp/Rmda3WexHLSUJgess00jctNPzOG
 84Q+ZSMKhiVvq5S0JDKEctKzywWcOeNHK+pmWiDYGru2AlkpJmiSnBfWDiQ5h0qexBe0svswD0
 qss6ShmnOMkQQWopc8IqSdfZNX55zp3PrIW0Q1TnNIam6TWH0JqCjm3XHNDOngQ7X7X3cz5eX0
 7+3y/Fabsv640jwrxyJ653YoIziOR0lHX98fF770+9Z043mFX9KXeCXUmOmzjPBBiN3xOLn1G9
 vb/8B6XK0QP0EAAA=
X-Change-ID: 20261104-submit-rawnand-retained-handle-lifetime-v1-0b4225e5ce0b
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Tze Yee Ng <tze.yee.ng@altera.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 Yuqiang Sun <izaiahsun@gmail.com>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Bernhard Frauendienst <kernel@nospam.obeliks.de>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>, 
 linux-hardening@vger.kernel.org, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>, 
 David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, Mike Rapoport <rppt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Jason Roberts <jason.e.roberts@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Michal Simek <michal.simek@amd.com>, Mason Yang <masonccyang@mxic.com.tw>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Lucas Stach <dev@lynxeye.de>, Dmitry Osipenko <digetx@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
 Stefan Agner <stefan@agner.ch>, Thierry Reding <thierry.reding@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org, 
 Shan-Chun Hung <schung@nuvoton.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Han Xu <han.xu@nxp.com>, 
 linux-renesas-soc@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Liang Yang <liang.yang@amlogic.com>, 
 linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Maxim Levitsky <maximlevitsky@gmail.com>
X-Mailer: b4 0.15.2

An MTD handle can outlive controller unbind. Its metadata and NAND locks
must remain valid, including when a writable file closes and calls sync,
while further hardware access must be rejected after disconnection.

This builds on earlier MTD removal-lifetime work. Commit 19bfa9ebebb5
("mtd: use refcount to prevent corruption") added MTD reference counting
[0], but retaining an MTD reference does not by itself retain the
driver-owned allocation containing the master. The read/unbind discussion
also covered raw NAND [1] and draining active operations [2]. Tze Yee Ng's
SPI-NOR series addresses the corresponding SPI-NOR paths [3].

Following Greg's review [7], separate class-device data from the MTD
backing allocation. Delete the device's interfaces and drain NVMEM and
class PM callbacks before releasing backing data. Bare device references
retain an independently allocated device, whose type, PM dispatch and
final release are built in even when MTD is modular. NVMEM similarly
disconnects and drains provider and layout callbacks before unregister
returns; retained consumers keep core-owned metadata and receive -ENODEV
on subsequent access.

Introduce opt-in backing-object ownership for MTD masters. Registered
nodes and acquired MTD handles retain the chip, while nested partitions
also retain their parent metadata. Unregister first so removal notifiers
can finish I/O, then disconnect raw NAND and drain admitted operations.
Hardware resources can be released without waiting for open files to close.

Virtual concatenations serialize publication and removal across physical
controllers. Disconnect and drain a published concatenation before any
component can disappear, then release its component references. An old
handle keeps the disconnected virtual device, independently of a later
replacement.

Run NAND and controller-specific cleanup during disconnection, while
the controller driver is still bound. Snapshot the OOB layout in core-owned
data before publication so metadata queries remain valid without driver
callbacks. The NAND core frees retained chip and controller allocations;
the final MTD put never calls back into the controller module. Ordinary
MTD and NVMEM handles retain the NAND core that implements their
operations, rather than the hardware driver.

Share allocation ownership across the raw-NAND drivers, including
partially published probes. Shared controllers remain allocated until
their last retained chip is released. R852 allocates a new chip for each
card, and NDFC allocates controller state per binding.

Based on NAND next at 30daaf3e7897, with Tze Yee Ng's module-reference
ordering fix [4], Karl Mehltretter's OTP cleanup fix [6], and the separately
posted registration, operation-locking and controller probe/teardown fixes
identified by the prerequisite metadata. TLA+ models and their assumptions
and coverage limits are available in [5].

[0] https://lore.kernel.org/r/20230620131905.648089-2-alexander.usyskin@intel.com
[1] https://lore.kernel.org/r/CAND4H7dz94Gsi_tXSQmLNme9uROnouOUwuCX9BW_+RCc2ZFDqA@mail.gmail.com
[2] https://lore.kernel.org/r/mafs0bjs73tbq.fsf@kernel.org
[3] https://lore.kernel.org/r/20261022035352.52129-1-tze.yee.ng@altera.com
[4] https://lore.kernel.org/r/20261022035352.52129-2-tze.yee.ng@altera.com
[5] https://github.com/jameshilliard/linux-h616-nand-tla
[6] https://lore.kernel.org/r/20260816163027.10044-1-kmehltretter@gmail.com
[7] https://lore.kernel.org/r/2026111037-stir-hermit-cb21@gregkh

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- Finish NAND and driver cleanup during disconnection, leaving final
  allocation release in the NAND core, following Greg's networking example.
- Snapshot OOB layouts before publication and drain complete BBM/BBT
  updates before releasing their working state.
- Separate MTD class-device allocation and final release from backing-object
  ownership, following Greg's review.
- Drain class PM callbacks under the device lock before detaching backing
  data; keep device-type and PM dispatch storage with the built-in device.
- Drain NVMEM provider and layout callbacks during unregister, retaining
  core-owned metadata for old consumers and retiring cells across rebind.
- Keep NVMEM consumer-owner references, with converted raw NAND
  providers naming the NAND core instead of the controller module.
  Release write-protect GPIOs once provider callbacks are drained.
- Acquire an MTD handle for PTP OCP firmware updates through a class device.
- Drain concatenation operations before releasing components, including
  concurrent removal of masters without opt-in lifetime ownership.
- Use scoped cleanup consistently in Tegra probe and add the introducing
  commits for Socrates and FSL UPM, following Sashiko's review.
- Link to v2: https://patch.msgid.link/20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com

Changes in v2:
- Keep the MTD device callback owner pinned through callback return,
  with the final module put performed by the device core.
- Retain virtual-concat components across removal and rebind, serialize
  staging/publication and unwind incomplete partition registrations.
- Balance Tegra's probe-time child-node reference separately from the
  reference retained for the chip lifetime.
- Refresh the prerequisite stack to the separately posted fixes, using
  the latest QCOM child-probe revision.
- Keep the lifetime changes on top of those fixes: preserve QCOM scan
  before publication, R852 per-card initialization and Intel probe
  hardware shutdown.
- Fold Macronix disconnection handling into the NAND disconnect patch;
  its operation locking is supplied by the posted prerequisite.
- Use Karl Mehltretter's posted OTP cleanup fix as a prerequisite in
  place of the duplicate preparatory patch.
- Keep the NVMEM context callback module pinned until its final callback
  returns, independently of the provider's consumer owner.
- Use the posted fixes for dynamic partition publication and partition-node
  ownership. Keep master get/put accounting independent of
  later master registration in the MTD ownership patch.
- Propagate disconnection through BBT error recovery without marking
  the eraseblock bad.
- Make suspend of a disconnected, retained NAND device a no-op.
- Handle R852 card events during removal while preventing new work from
  being queued.
- Initialize Denali and Atmel cleanup variables at allocation and add
  the introducing-commit trailers for Orion and MPC5121.
- Link to v1: https://patch.msgid.link/20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org

---
James Hilliard (58):
      nvmem: disconnect provider callbacks before unregister returns
      mtd: acquire an MTD handle from a referenced class device
      mtd: separate class devices from retained backing objects
      mtd: retain virtual concatenations across component removal
      mtd: rawnand: separate hardware disconnection from cleanup
      mtd: rawnand: share retained chip and controller ownership
      mtd: rawnand: sunxi: retain chip state until the final MTD put
      mtd: rawnand: plat_nand: retain open-handle state on removal
      mtd: rawnand: gpio: retain open-handle state on removal
      mtd: rawnand: stm32_fmc2: retain open-handle state on removal
      mtd: rawnand: denali: retain chips across controller removal
      mtd: rawnand: arasan: retain chips across controller removal
      mtd: rawnand: mxic: retain open-handle state on removal
      mtd: rawnand: intel: retain open-handle state on removal
      mtd: rawnand: tegra: retain open-handle state on removal
      mtd: rawnand: mtk: retain chips across controller removal
      mtd: rawnand: rockchip: retain chips across controller removal
      mtd: rawnand: atmel: retain chips across controller removal
      mtd: rawnand: orion: retain open-handle state on removal
      mtd: rawnand: socrates: retain open-handle state on removal
      mtd: rawnand: fsl_upm: retain open-handle state on removal
      mtd: rawnand: pasemi: retain open-handle state on removal
      mtd: rawnand: ams-delta: retain open-handle state on removal
      mtd: rawnand: xway: retain open-handle state on removal
      mtd: rawnand: hisi504: retain open-handle state on removal
      mtd: rawnand: vf610: retain open-handle state on removal
      mtd: rawnand: technologic: retain open-handle state on removal
      mtd: rawnand: loongson: retain open-handle state on removal
      mtd: rawnand: ma35d1: retain open-handle state on removal
      mtd: rawnand: pl35x: retain open-handle state on removal
      mtd: rawnand: mxc: retain open-handle state on removal
      mtd: rawnand: fsmc: retain open-handle state on removal
      mtd: rawnand: gpmi: retain open-handle state on removal
      mtd: rawnand: omap2: retain open-handle state on removal
      mtd: rawnand: marvell: retain open-handle state on removal
      mtd: rawnand: renesas: retain open-handle state on removal
      mtd: rawnand: meson: retain open-handle state on removal
      mtd: rawnand: cadence: retain open-handle state on removal
      mtd: rawnand: qcom: retain open-handle state on removal
      mtd: rawnand: cafe: retain open-handle state on removal
      mtd: rawnand: brcmnand: retain open-handle state on removal
      mtd: rawnand: au1550nd: retain chip state across removal
      mtd: rawnand: sharpsl: retain chip state across removal
      mtd: rawnand: davinci: retain chip state across removal
      mtd: rawnand: sh_flctl: retain chip state across removal
      mtd: rawnand: lpc32xx_slc: retain chip state across removal
      mtd: rawnand: lpc32xx_mlc: retain chip state across removal
      mtd: rawnand: ndfc: retain chip state across removal
      mtd: rawnand: txx9ndfmc: retain chip state across removal
      mtd: rawnand: ingenic: retain chip state across removal
      mtd: rawnand: mpc5121: retain chip state across removal
      mtd: rawnand: bcm47xxnflash: retain chip state across removal
      mtd: rawnand: fsl_elbc: retain chip state across removal
      mtd: rawnand: fsl_ifc: retain chip state across removal
      mtd: rawnand: r852: retain chip state across removal
      mtd: rawnand: nandsim: retain chip state across removal
      mtd: rawnand: cs553x: retain chip state across removal
      mtd: rawnand: diskonchip: retain chip state across removal

 drivers/Makefile                                   |   2 +-
 drivers/media/pci/cobalt/cobalt-flash.c            |   2 +-
 drivers/mtd/Kconfig                                |   5 +
 drivers/mtd/Makefile                               |   1 +
 drivers/mtd/devices/bcm47xxsflash.c                |   2 +-
 drivers/mtd/devices/docg3.c                        |   4 +-
 drivers/mtd/devices/mchp23k256.c                   |   2 +-
 drivers/mtd/devices/mchp48l640.c                   |   2 +-
 drivers/mtd/devices/mtd_dataflash.c                |   2 +-
 drivers/mtd/devices/mtd_intel_dg.c                 |  30 +-
 drivers/mtd/devices/powernv_flash.c                |   4 +-
 drivers/mtd/devices/spear_smi.c                    |   2 +-
 drivers/mtd/devices/sst25l.c                       |   2 +-
 drivers/mtd/devices/st_spi_fsm.c                   |   8 +-
 drivers/mtd/hyperbus/hyperbus-core.c               |   2 +-
 drivers/mtd/lpddr/lpddr2_nvm.c                     |   2 +-
 drivers/mtd/maps/lantiq-flash.c                    |   2 +-
 drivers/mtd/maps/physmap-core.c                    |   2 +-
 drivers/mtd/maps/plat-ram.c                        |   2 +-
 drivers/mtd/maps/pxa2xx-flash.c                    |   2 +-
 drivers/mtd/maps/sa1100-flash.c                    |   2 +-
 drivers/mtd/maps/vmu-flash.c                       |   2 +-
 drivers/mtd/mtd_blkdevs.c                          |   2 +-
 drivers/mtd/mtd_virt_concat.c                      | 526 +++++++++++----------
 drivers/mtd/mtdconcat.c                            | 103 +++-
 drivers/mtd/mtdcore.c                              | 304 +++++++-----
 drivers/mtd/mtdcore.h                              |   5 +
 drivers/mtd/mtddevice.c                            |  59 +++
 drivers/mtd/mtddevice.h                            |  12 +
 drivers/mtd/mtdpart.c                              |  29 +-
 drivers/mtd/mtdpstore.c                            |  50 +-
 drivers/mtd/nand/ecc.c                             |   3 +-
 drivers/mtd/nand/onenand/generic.c                 |   2 +-
 drivers/mtd/nand/onenand/onenand_omap2.c           |   2 +-
 drivers/mtd/nand/onenand/onenand_samsung.c         |   2 +-
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/ams-delta.c                   |  28 +-
 drivers/mtd/nand/raw/arasan-nand-controller.c      |  49 +-
 drivers/mtd/nand/raw/atmel/nand-controller.c       |  44 +-
 drivers/mtd/nand/raw/au1550nd.c                    |  23 +-
 drivers/mtd/nand/raw/bcm47xxnflash/main.c          |  18 +-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c           |  65 ++-
 drivers/mtd/nand/raw/cadence-nand-controller.c     |  51 +-
 drivers/mtd/nand/raw/cafe_nand.c                   |  27 +-
 drivers/mtd/nand/raw/cs553x_nand.c                 |  44 +-
 drivers/mtd/nand/raw/davinci_nand.c                |  26 +-
 drivers/mtd/nand/raw/denali.c                      |  28 +-
 drivers/mtd/nand/raw/denali_dt.c                   |  13 +-
 drivers/mtd/nand/raw/denali_pci.c                  |   9 +-
 drivers/mtd/nand/raw/diskonchip.c                  |  17 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c               |  56 ++-
 drivers/mtd/nand/raw/fsl_ifc_nand.c                |  48 +-
 drivers/mtd/nand/raw/fsl_upm.c                     |  20 +-
 drivers/mtd/nand/raw/fsmc_nand.c                   |  19 +-
 drivers/mtd/nand/raw/gpio.c                        |  18 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c         |  19 +-
 drivers/mtd/nand/raw/hisi504_nand.c                |  20 +-
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c    |  41 +-
 drivers/mtd/nand/raw/intel-nand-controller.c       |  20 +-
 drivers/mtd/nand/raw/internals.h                   |   2 +-
 drivers/mtd/nand/raw/loongson-nand-controller.c    |  21 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c                 |  38 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c                 |  40 +-
 drivers/mtd/nand/raw/marvell_nand.c                |  46 +-
 drivers/mtd/nand/raw/meson_nand.c                  |  49 +-
 drivers/mtd/nand/raw/mpc5121_nfc.c                 |  26 +-
 drivers/mtd/nand/raw/mtk_nand.c                    |  40 +-
 drivers/mtd/nand/raw/mxc_nand.c                    |  23 +-
 drivers/mtd/nand/raw/mxic_nand.c                   |  23 +-
 drivers/mtd/nand/raw/nand_base.c                   | 103 +++-
 drivers/mtd/nand/raw/nand_bbt.c                    |  24 +-
 drivers/mtd/nand/raw/nand_lifetime.c               | 246 ++++++++++
 drivers/mtd/nand/raw/nand_macronix.c               |   8 +-
 drivers/mtd/nand/raw/nand_onfi.c                   |   4 +-
 drivers/mtd/nand/raw/nandsim.c                     |  21 +-
 drivers/mtd/nand/raw/ndfc.c                        |  34 +-
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  |  42 +-
 drivers/mtd/nand/raw/omap2.c                       |  27 +-
 drivers/mtd/nand/raw/orion_nand.c                  |  24 +-
 drivers/mtd/nand/raw/pasemi_nand.c                 |  22 +-
 drivers/mtd/nand/raw/pl35x-nand-controller.c       |  38 +-
 drivers/mtd/nand/raw/plat_nand.c                   |  20 +-
 drivers/mtd/nand/raw/qcom_nandc.c                  |  39 +-
 drivers/mtd/nand/raw/r852.c                        | 111 +++--
 drivers/mtd/nand/raw/r852.h                        |   1 +
 drivers/mtd/nand/raw/renesas-nand-controller.c     |  37 +-
 drivers/mtd/nand/raw/rockchip-nand-controller.c    |  45 +-
 drivers/mtd/nand/raw/sh_flctl.c                    |  22 +-
 drivers/mtd/nand/raw/sharpsl.c                     |  22 +-
 drivers/mtd/nand/raw/sm_common.c                   |  15 +-
 drivers/mtd/nand/raw/sm_common.h                   |   2 +-
 drivers/mtd/nand/raw/socrates_nand.c               |  19 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c             |  19 +-
 drivers/mtd/nand/raw/sunxi_nand.c                  |  46 +-
 drivers/mtd/nand/raw/technologic-nand-controller.c |  22 +-
 drivers/mtd/nand/raw/tegra_nand.c                  |  27 +-
 drivers/mtd/nand/raw/txx9ndfmc.c                   |  41 +-
 drivers/mtd/nand/raw/vf610_nfc.c                   |  20 +-
 drivers/mtd/nand/raw/xway_nand.c                   |  24 +-
 drivers/mtd/nand/spi/core.c                        |   2 +-
 drivers/mtd/nand/spi/esmt.c                        |   2 +-
 drivers/mtd/nand/spi/micron.c                      |   4 +-
 drivers/mtd/nand/spi/otp.c                         |   2 +-
 drivers/mtd/spi-nor/core.c                         |   2 +-
 drivers/mtd/ubi/build.c                            |   2 +-
 drivers/nvmem/Kconfig                              |   1 +
 drivers/nvmem/core.c                               | 297 ++++++++----
 drivers/nvmem/internals.h                          |  13 +-
 drivers/nvmem/layouts.c                            |   2 +
 drivers/ptp/ptp_ocp.c                              |   7 +-
 include/linux/mtd/concat.h                         |  22 +-
 include/linux/mtd/mtd.h                            |  21 +-
 include/linux/mtd/rawnand.h                        |  37 +-
 include/linux/nvmem-provider.h                     |   3 +
 114 files changed, 2551 insertions(+), 1186 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261104-submit-rawnand-retained-handle-lifetime-v1-0b4225e5ce0b
prerequisite-patch-id: a51b9cb4077105499133c413d58c7ad21d973b38
prerequisite-patch-id: b3679cda4dcb45ce7712bffe2dd0576b254df44d
prerequisite-patch-id: 07b5c70e44ad951d20eea9478c98fda35ec765c0
prerequisite-patch-id: abea50275922fe359d72ca4de5cbc211b04bbd57
prerequisite-patch-id: 57776b214ffb0331319f024412f21d35e4ca9056
prerequisite-patch-id: 09be2baaffe1f053704263cc4b0d39f2faa4f49c
prerequisite-patch-id: c3ad85600dc897ac310be450d8daa2275fb91ee6
prerequisite-patch-id: 4a85600553ddcc7db5a9537efd905a71cd623f65
prerequisite-patch-id: 579990ee4a49297efc5a593b00efb9cd73fa15e8
prerequisite-patch-id: 2ee61a8a32fd147d52e0f9d03758634912d8bfef
prerequisite-patch-id: 1487df8ce8e6c48471fd77c7470ce9de582dfe3c
prerequisite-patch-id: 5ecbe86f928d9c5c0bf2cb6065c5672708511fc4
prerequisite-patch-id: ac68e9b65d3aa5661bd7ac0f2e77dcf5c75fcfe0
prerequisite-patch-id: e70f0f0c4d430d416a3ad848b37ffad16bd7df07
prerequisite-patch-id: 05adcddbc50f745ee2640b8c21f3bf76a217f249
prerequisite-patch-id: 0b60b7ab6196076f327c919be5e7b8bb2051ee12

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

