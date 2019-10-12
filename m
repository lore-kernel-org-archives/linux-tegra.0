From: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
Subject: [PATCH 0/1] arm64: tegra: enable SDIO on Jetson Nano M.2 Key E
Date: Sat, 12 Oct 2019 09:52:12 +0200
Message-ID: <20191012075213.4880-1-tszucs@protonmail.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
List-Id: linux-tegra@vger.kernel.org

Hi All,

Changes here have been tested with various u-blox SDIO Wi-Fi modules.
It would be great to have support upstream.

Kind regards,
Tamas

Tamás Szűcs (1):
  arm64: tegra: enable SDIO on Jetson Nano M.2 Key E

 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.20.1
