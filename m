From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 0/5] NVIDIA Tegra AHB DMA controller driver
Date: Thu, 28 Sep 2017 15:24:57 +0300
Message-ID: <275b6188-00de-3c45-9764-f16332d2dbdd@gmail.com>
References: <cover.1506380746.git.digetx@gmail.com>
 <20170928093104.GC30097@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170928093104.GC30097@localhost>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 28.09.2017 12:31, Vinod Koul wrote:
> On Tue, Sep 26, 2017 at 02:22:01AM +0300, Dmitry Osipenko wrote:
>> NVIDIA Tegra20/30 SoC's have AHB DMA controller. It has 4 DMA channels,
>> supports AHB <-> Memory and Memory <-> Memory transfers, slave / master
>> modes. This driver is primarily supposed to be used by gpu/host1x in a
>> master mode, performing 3D HW context stores.
>>
>> Dmitry Osipenko (5):
>>   clk: tegra: Add AHB DMA clock entry
>>   clk: tegra: Bump SCLK clock rate to 216MHz on Tegra20
>>   dt-bindings: Add DT bindings for NVIDIA Tegra AHB DMA controller
>>   dmaengine: Add driver for NVIDIA Tegra AHB DMA controller
>>   ARM: dts: tegra: Add AHB DMA controller nodes
> 
> I don't think they are dependent, so consider sending them separately
> 

Well, they are dependent in a sense of making driver usable. Only the "SCLK rate
bump" patch isn't strictly needed.

Splitting this series won't cause building failures, but all pieces should be in
place for the working driver. So I suppose it is okay if clk patches would get
in earlier than the others, I'll split the series.

Thank you for the review.

-- 
Dmitry
