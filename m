Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296661;
	b=ANNw5i73C6T+fFiP+gUSEUYT2Z+JuF3zAFNnSWGOKT5/ENo7eW/uJd4KfaS2n5bi1Skd
	 GvpY6K1Zo3zdQO9+78E674vk5gfEJr4hnnZ0PTlh4PC5pR2FIr4Snf18DzYEnwnwIr2QK
	 aA2/ohN6xsxS0ocxPNolX7ONF3yELffYPje4PYKXdYNgJBuS9OPDHYGd9NgZMD3/e9oBa
	 tW90L9awKnMCVVmyvqVTm7WoZy4soaRPcxy1I1EmYd3VwGRhb1OuOWlhKk3TNtVdDaAsv
	 hMf4Zrj3HOUsoZjmiaB7UfGmHjVIPdn39yCNxVWtGZnRtdFwKVKsyUD9Qo9bOjQTuGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=AROSoZM6g0rhbo1ze6sPpGWI/yVIERU0vwNzW3aeH5k=;
	b=O9fKn3aw4M70FwJxrzSakHazsDPCeoNztdRDghhmqW5wUy48MBEaGeHmMFHkLLw6CCzj
	 FmhqIi4N95DQblmwOa/r5FvD/zdI1iYX5DRiOusN7RUAyRUkdRtqWkdKiEszoY8kYxgvw
	 bPF4UHWqZGLFPCqumWxkccCV/J/x0zGztbn3dugw4ibFz2yBkTKOf8z7411SO9q+3Ekif
	 qcWXl9VpqrqNa2+fGF8iFwpUAbdkmLhUeIjtyUh0C12EU36Ebso27Td4vt5CPo1IZejsw
	 8bM6+8/XRPCX6TZW7LcuMxBTvHOIQEcJcrNfSZ5HD2DeEXYGat/dibjfczC16neAKbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xN/mrGHY";
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEB7606A31C
	for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 07:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DEB7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xN/mrGHY
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-451a49abd8aso1762330fac.3
        for <linux-tegra@vger.kernel.org>; Mon, 09 Nov 2026 23:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296660; x=1794901460; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AROSoZM6g0rhbo1ze6sPpGWI/yVIERU0vwNzW3aeH5k=;
        b=xN/mrGHYAlI1NgL7zeIpyvqozm8dXjuGxkZuQrFgaMA1nzNKzSLVE/sS7l+ahIBJp8
         AENTxVguRgWz8bHgKZsjCdMTkJviHGGRvWWwluncbSLDqhT5equkHj9RsTkVfe5gxEzt
         bnAap3S36nUmv5exCuccYSsAnoRrLrXOmGR4XMioQk2xIq7MvHhd+LoRaxTxfLReUyuV
         rv5GdUXaE0/kLGkixZiAHQit4FS0aAEwtFH0O5duEzrNl0MCsOw8t1woiWviIsAOyvIO
         YqZ58b+cIgfSs0LAXmQeS1zUHSSzttc3AdDpMyBWlkmsHI49OxoxTJ5YG8AKsNcVcjas
         BzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296660; x=1794901460;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AROSoZM6g0rhbo1ze6sPpGWI/yVIERU0vwNzW3aeH5k=;
        b=D1UTQH1bPOJ+ZfS6p6jOiyFBKEdA8TGgShvirZZ72sdUTmu/HWqrdw9aKABiS/AVNV
         cK3IW9uHpvgi/3mpmm+g2OEqSbDE90mVP0eebim+CvT4e/BdguI7eUSjKUTNCBvTAg+M
         BS5HEEg3TZ9CIFNuuQ75fESKj2S1tIZ1JOWvW4OHluRNEtgjz5g2YdKJoiPLPJSq8+Ir
         MWLToovXDhTNKhDiG02kBx5CNMZyWIcJkMdypG3iI9cKT9eexZJivw8y5BPaOE38rKvs
         4i5eHozIQVBj+GCj33iNyvfAuE8v/C1638eJGH1ml5I9YzCI1cocGc90m6fGOpgtD4nr
         yubQ==
X-Forwarded-Encrypted: i=1; AL+hErHoW5O2Q4cTa1XfNMFmYaYK8KQGrQ8HYSZ5QItfpW4wg0QNJqAW7fb1dLnuWw94/lRPvqItcYEu/SHTLg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+/r4jgyRw5qJuDqxZUEwCm9kXCzDzrrHBThmRVoP+b/iIGLEMH
	QL8NSqxj9p0iGX44zh1OviJMos8kZ7rFKKNHZTiSKEpXGg4GG+eGtilz
X-Gm-Gg: AYBFou2FuUO+bNQR/djiUmNGb9RWjDjgF/eFdcdcLPS2rg8l0SX40rdtvBNwCvLj6ur
	g9QDRwctVRsxk4dMDNkO9P+7Z1Ol0kM7fgPP8z2uMpO+u6IIPIugXpuh1qTYY0zL98ic951Udhv
	HR9viIk0mK0iVnLWdjZWsnVs2HjZUlhn+9wfs+mTPdp7ccjKyPrnOeVe2f6oW0cRNNxyH8Wq4kp
	1ThTAXL7+ZP9k2wefUa/ALPTprfutMSG9QdgGaTgCIM5YKQdyXLDqEsIrdcPHFoHZ0Vrcjbn/bx
	R8v+S0trQi1jNdyZOKEdMxr7abbWpbiTvsQK4LnUTkWNuqOhPUmwAQG81XILvl6VGP+tdIDbmaH
	via/tH3k9hA8WdsG9zeTEkTbQHjXEU+6X+usu4dkHH5DanaNnzl06/XrITQToQSRzq49qkNgoPr
	B3k+OuAtHoZchmO6UMPpV2gpDcRlait9BqC0PDJf7iOMEL/FBprhKAWBQaGhzn1Rxfp/FhiMS9D
	Whyzt2XMrtlHCcGlZ/NnRWF7LoOr9VKSrcK2qrHUNeR2vjc4+29Trz6+AmfOuMeVDnqocMSGW/1
	s7Nwx2lE6Je4Z2l8gOa+wZakwoo7rpyvz/2YAQyukjy9pwvWdVeSmpYm5wL6kdN6Y8lqkqjjRBp
	DmLgMZbAymLnts4xLh+Taz+hDJdOur51IossC9nt/2BpT2xVw7jT5jaLVZm7TxARkhSFWfSNEmj
	w0tMjX5bhjErXo/w9Fnw0/EW0owBbHH2wkemevPyjSUjwsQtZxZxA5yS7mH9nuXdqXXFva8uvZ
X-Received: by 2002:a05:6808:e85:b0:4ec:4c7e:37b5 with SMTP id 5614622812f47-5683cc8615cmr1404459b6e.29.1794296659854;
        Mon, 09 Nov 2026 23:44:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 00/58] mtd: rawnand: retain chip and controller state
 across removal
Date: Tue, 10 Nov 2026 00:44:03 -0700
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5VUzW6cNwx8FWPP/QqKokTJp75HkYP4F3+FvU53N
 26CwO9e7iYo4L0VOgngcIackX4czn7a/Xx4fPhxOPnbft5fj3nB3x4O+rSOn33bLe8HBOylAG3
 nr/KyX7bT+ue4jrad/LL2o9uWxfbs2/MeftlffHsrGwghNm/qIIds+OXksX+7kf356ec9u/3le
 rky/Ko4+d9fU8XlZ9nhy7roU2p4fFityFQhYC7QaM5Sq1Kp1obyMiw2uUodtz7/oaR2nmqLLKG
 pJMEoEY5m0LgLNrIgso8oYGnK4ETLZiuG4L4m8dA5wlZtrtybwkfUEl8NkNtEDK9tGqMmc25AF
 EsRIBFr/BHVmK86CkUI1FpqmQFIVDBypqQiXRNav1M4xVHWylFKQKsMhL2qkoDVGRhrUdDUjyi
 ty0brAKZj8tJaQJwa2LC1MJWHzOJ+x0XrhmmtmqmySVszGT0sdS0uah1r9HY/15wz90aLJs6s1
 rbarALgyaLGNVZpfucXJntZY1UMK8TW0CGmQeU2eqVZ0IaEx0dUocEWQ314VxrEJYxZmRjUZxo
 w0NKRu22ki+Kjx8RhU9NOCVTpkM62zsgwWimhdOey9uFTerO6Vuu9iOUmITCzZRqZmxYafpcNZ
 4g8SkYVjEpfVytoSOWIZaVnFwu4y0au19RMtEEwNXfsBDIyTFEluC8sHEjzDpUzCC/pZXbgHhV
 ZZ8nANGcZIggtTS54Rck6+6avL/mmHx9SWSaqOmc4JF23KYzeBHR0s+6YYeYM0OH6ep/28+X19
 P32c7yV22P99Unw//kkrv/EBmUUz+0o6fjj88van39PTYdP7+/v/wKo39d0ogQAAA==
X-Change-ID: 20261104-submit-rawnand-retained-handle-lifetime-v1-0b4225e5ce0b
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Tze Yee Ng <tze.yee.ng@altera.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 driver-core@lists.linux.dev, Yuqiang Sun <izaiahsun@gmail.com>, 
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
driver-owned allocation containing the master. The 2025 read/unbind
discussion also covered raw NAND [1] and highlighted the need to drain
active operations before releasing resources [2]. Tze Yee Ng's SPI-NOR
series addresses the corresponding SPI-NOR paths [3]. This series adds
shared backing-object ownership and applies it to raw-NAND drivers.

Introduce an opt-in backing-object lifetime for MTD masters and separate
raw-NAND hardware disconnection from final cleanup. Registered MTD nodes,
device references and open handles retain the backing chip; nested
partitions also retain their parent metadata. Removal notifiers can
finish I/O before disconnection drains admitted operations. Hardware
resources are then released without waiting for open files to close.

Virtual concatenations retain their original hidden components and backing
objects across removal. Serialize staging across controllers, publish in
DT order after partition registration completes, and release incomplete
registrations without disturbing another controller's components.

OTP providers retain their callback context through final NVMEM device
release while keeping their existing physical-device parent. Add opt-in
NVMEM context references to support that ownership.

Device release callbacks keep their module loaded until they return.
Add an opt-in device-core owner reference so MTD can hand the final
module put to built-in code after its callback finishes.

Share the chip and controller ownership helpers and convert the raw-NAND
controller drivers. Each driver conversion keeps metadata cleanup
separate from hardware teardown, including partially published probes.
Shared controllers remain allocated until their last retained chip is
released. R852 allocates a new chip for each inserted card, and NDFC
allocates controller state per binding, so old handles cannot refer to
replacement media or a new binding.

The series adds the common lifetime support and converts its driver
users. It is based on NAND next at 30daaf3e7897 with Tze Yee Ng's
module-reference ordering fix [4] and Karl Mehltretter's upstream OTP
cleanup fix [6]. The separately posted MTD registration, NAND
operation-locking and controller probe/teardown fixes are prerequisites
as well; the prerequisite metadata identifies their posted versions.
The master-open reference accounting fix is included in the MTD
ownership patch because it overlaps the module-reference ordering
prerequisite.

TLA+ models of retained-handle, controller and OTP ownership, including
their assumptions and coverage limits, are available in [5].

[0] https://lore.kernel.org/r/20230620131905.648089-2-alexander.usyskin@intel.com
[1] https://lore.kernel.org/r/CAND4H7dz94Gsi_tXSQmLNme9uROnouOUwuCX9BW_+RCc2ZFDqA@mail.gmail.com
[2] https://lore.kernel.org/r/mafs0bjs73tbq.fsf@kernel.org
[3] https://lore.kernel.org/r/20261022035352.52129-1-tze.yee.ng@altera.com
[4] https://lore.kernel.org/r/20261022035352.52129-2-tze.yee.ng@altera.com
[5] https://github.com/jameshilliard/linux-h616-nand-tla
[6] https://lore.kernel.org/r/20260816163027.10044-1-kmehltretter@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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

---
James Hilliard (58):
      nvmem: retain provider context through final device release
      driver core: retain the owner of device release callbacks
      mtd: add opt-in lifetime ownership for backing objects
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

 drivers/base/core.c                                |   9 +
 drivers/mtd/mtd_virt_concat.c                      | 513 ++++++++++-----------
 drivers/mtd/mtdcore.c                              | 199 ++++++--
 drivers/mtd/mtdcore.h                              |   3 +
 drivers/mtd/mtdpart.c                              |  14 +-
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/ams-delta.c                   |  29 +-
 drivers/mtd/nand/raw/arasan-nand-controller.c      |  57 ++-
 drivers/mtd/nand/raw/atmel/nand-controller.c       |  59 ++-
 drivers/mtd/nand/raw/au1550nd.c                    |  26 +-
 drivers/mtd/nand/raw/bcm47xxnflash/main.c          |  23 +-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c           |  72 ++-
 drivers/mtd/nand/raw/cadence-nand-controller.c     |  60 ++-
 drivers/mtd/nand/raw/cafe_nand.c                   |  37 +-
 drivers/mtd/nand/raw/cs553x_nand.c                 |  46 +-
 drivers/mtd/nand/raw/davinci_nand.c                |  29 +-
 drivers/mtd/nand/raw/denali.c                      |  31 +-
 drivers/mtd/nand/raw/denali_dt.c                   |  21 +-
 drivers/mtd/nand/raw/denali_pci.c                  |  15 +-
 drivers/mtd/nand/raw/diskonchip.c                  |  21 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c               |  68 ++-
 drivers/mtd/nand/raw/fsl_ifc_nand.c                |  58 ++-
 drivers/mtd/nand/raw/fsl_upm.c                     |  23 +-
 drivers/mtd/nand/raw/fsmc_nand.c                   |  22 +-
 drivers/mtd/nand/raw/gpio.c                        |  21 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c         |  22 +-
 drivers/mtd/nand/raw/hisi504_nand.c                |  23 +-
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c    |  49 +-
 drivers/mtd/nand/raw/intel-nand-controller.c       |  23 +-
 drivers/mtd/nand/raw/internals.h                   |   2 +-
 drivers/mtd/nand/raw/loongson-nand-controller.c    |  23 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c                 |  26 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c                 |  26 +-
 drivers/mtd/nand/raw/marvell_nand.c                |  54 ++-
 drivers/mtd/nand/raw/meson_nand.c                  |  55 ++-
 drivers/mtd/nand/raw/mpc5121_nfc.c                 |  29 +-
 drivers/mtd/nand/raw/mtk_nand.c                    |  44 +-
 drivers/mtd/nand/raw/mxc_nand.c                    |  24 +-
 drivers/mtd/nand/raw/mxic_nand.c                   |  26 +-
 drivers/mtd/nand/raw/nand_base.c                   |  76 ++-
 drivers/mtd/nand/raw/nand_bbt.c                    |  24 +-
 drivers/mtd/nand/raw/nand_lifetime.c               | 118 +++++
 drivers/mtd/nand/raw/nand_macronix.c               |   4 +-
 drivers/mtd/nand/raw/nandsim.c                     |  24 +-
 drivers/mtd/nand/raw/ndfc.c                        |  37 +-
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  |  44 +-
 drivers/mtd/nand/raw/omap2.c                       |  45 +-
 drivers/mtd/nand/raw/orion_nand.c                  |  27 +-
 drivers/mtd/nand/raw/pasemi_nand.c                 |  25 +-
 drivers/mtd/nand/raw/pl35x-nand-controller.c       |  46 +-
 drivers/mtd/nand/raw/plat_nand.c                   |  24 +-
 drivers/mtd/nand/raw/qcom_nandc.c                  |  46 +-
 drivers/mtd/nand/raw/r852.c                        | 114 +++--
 drivers/mtd/nand/raw/r852.h                        |   1 +
 drivers/mtd/nand/raw/renesas-nand-controller.c     |  45 +-
 drivers/mtd/nand/raw/rockchip-nand-controller.c    |  49 +-
 drivers/mtd/nand/raw/sh_flctl.c                    |  25 +-
 drivers/mtd/nand/raw/sharpsl.c                     |  25 +-
 drivers/mtd/nand/raw/sm_common.c                   |  15 +-
 drivers/mtd/nand/raw/sm_common.h                   |   2 +-
 drivers/mtd/nand/raw/socrates_nand.c               |  22 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c             |  22 +-
 drivers/mtd/nand/raw/sunxi_nand.c                  |  59 ++-
 drivers/mtd/nand/raw/technologic-nand-controller.c |  25 +-
 drivers/mtd/nand/raw/tegra_nand.c                  |  39 +-
 drivers/mtd/nand/raw/txx9ndfmc.c                   |  42 +-
 drivers/mtd/nand/raw/vf610_nfc.c                   |  22 +-
 drivers/mtd/nand/raw/xway_nand.c                   |  27 +-
 drivers/nvmem/core.c                               |  18 +-
 drivers/nvmem/internals.h                          |   2 +
 include/linux/device.h                             |   4 +
 include/linux/mtd/concat.h                         |  18 +-
 include/linux/mtd/mtd.h                            |  16 +
 include/linux/mtd/rawnand.h                        |  21 +-
 include/linux/nvmem-provider.h                     |  12 +
 75 files changed, 2240 insertions(+), 808 deletions(-)
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

