From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH v3] crypto: driver for tegra AES hardware
Date: Mon, 14 Nov 2011 09:32:12 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1740805ABE@HQMAIL01.nvidia.com>
References: <1321094567-16561-1-git-send-email-vwadekar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <1321094567-16561-1-git-send-email-vwadekar@nvidia.com>
Content-Language: en-US
Sender: linux-crypto-owner@vger.kernel.org
To: Varun Wadekar <vwadekar@nvidia.com>, "Olof Johansson (olof@lixom.net)" <olof@lixom.net>, "Colin Cross (ccross@android.com)" <ccross@android.com>
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "herbert@gondor.hengli.com.au" <herbert@gondor.hengli.com.au>, "davem@davemloft.net" <davem@davemloft.net>
List-Id: linux-tegra@vger.kernel.org

vwadekar@nvidia.com wrote at Saturday, November 12, 2011 3:43 AM:
> driver supports ecb/cbc/ofb/ansi_x9.31rng modes,
> 128, 192 and 256-bit key sizes

This will fail to build as a module unless your other patch "arm: tegra:
export tegra_chip_uid" is also merged. You should mention this fact when
posting the patch, below the --- line.

I'll let Olof and the crypto maintainers comment on the solution they'd
prefer for this, but perhaps it's: have one of the Tegra maintainers ack
that other patch, then have the crypto maintainer merge both patches in
order into the crypto tree.

-- 
nvpublic
