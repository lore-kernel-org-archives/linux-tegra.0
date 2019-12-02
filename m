From: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
Subject: [PATCH v2 0/1] arm64: tegra: enable SDIO on Jetson Nano M.2 Key E
Date: Mon,  2 Dec 2019 22:51:59 +0100
Message-ID: <20191202215200.9656-1-tszucs@protonmail.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
List-Id: linux-tegra@vger.kernel.org

It turns out SDMMC3 on the Jetson Nano module is wired to respective pins of
the carrier's M.2 Key E socket. However, it is not enabled. I see no reason
why. This block is functional and has a fixed 1.8 V I/O supply. Perfect for
SDIO cards nowdays. I think it would make sense to enable this feature. PCIe
could be used for something else.

Kind regards,
Tamas


Tamás Szűcs (1):
  arm64: tegra: Enable SDIO on Jetson Nano M.2 Key E

 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.20.1
