From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH v8 0/2] crypto: driver for Tegra AES hardware
Date: Fri, 16 Dec 2011 11:58:40 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF176BE927A0@HQMAIL01.nvidia.com>
References: <1324034755-3295-1-git-send-email-vwadekar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <1324034755-3295-1-git-send-email-vwadekar@nvidia.com>
Content-Language: en-US
Sender: linux-crypto-owner@vger.kernel.org
To: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Olof Johansson <olof@lixom.net>, Colin Cross <ccross@android.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Varun Wadekar <vwadekar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Varun Wadekar wrote at Friday, December 16, 2011 4:26 AM:
> The tegra crypto driver uses the tegra_chip_uid API for the RNG
> calculation. If one wants to build tegra-aes as a module, then
> tegra_chip_uid needs to be exported.

Varun,

I notice you didn't CC any of the maintainers of the crypto or Tegra
subsystems, so those people may simply not have seen your message in
the tide of other mailing lists postings.

I've CC'd them on this email to alert them to this thread.

-- 
nvpublic
