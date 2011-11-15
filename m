From: Varun Wadekar <vwadekar@nvidia.com>
Subject: Re: [PATCH v1] crypto: driver for tegra AES hardware
Date: Tue, 15 Nov 2011 09:40:42 +0530
Message-ID: <4EC1E642.2090309@nvidia.com>
References: <1320489734-9085-1-git-send-email-vwadekar@nvidia.com> <20111105181025.69918e625a169ccb30d9b7c8@freescale.com> <4EBE48E8.60205@nvidia.com> <74CDBE0F657A3D45AFBB94109FB122FF1740805AB5@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF1740805AB5@HQMAIL01.nvidia.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>
Cc: Kim Phillips <kim.phillips@freescale.com>, "herbert@gondor.hengli.com.au" <herbert@gondor.hengli.com.au>, "davem@davemloft.net" <davem@davemloft.net>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


>> Why?
> To avoid redundant work; there's little point memset()ing a region that's
> going to be copied over the top of immediately afterwards.
>

The length used for memset is different from the length being copied
over. I am initially memsetting the entire key struct (which contains
the key + original IV + updated IV) and then copying only the key. Down
the line we copy the original IV and/or the updated IV in this memory space.
