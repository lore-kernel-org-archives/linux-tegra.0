From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5] dmaengine: tegra-apb: Support per-burst residue
 granularity
Date: Thu, 25 Jul 2019 16:44:07 +0300
Message-ID: <e8dc55b5-586c-02a5-ec30-67bf39c87dda@gmail.com>
References: <20190705150519.18171-1-digetx@gmail.com>
 <20190725102613.GT12733@vkoul-mobl.Dlink>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725102613.GT12733@vkoul-mobl.Dlink>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Ben Dooks <ben.dooks@codethink.co.uk>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

25.07.2019 13:26, Vinod Koul пишет:
> On 05-07-19, 18:05, Dmitry Osipenko wrote:
>> Tegra's APB DMA engine updates words counter after each transferred burst
>> of data, hence it can report transfer's residual with more fidelity which
>> may be required in cases like audio playback. In particular this fixes
>> audio stuttering during playback in a chromium web browser. The patch is
>> based on the original work that was made by Ben Dooks and a patch from
>> downstream kernel. It was tested on Tegra20 and Tegra30 devices.
> 
> Applied, thanks
> 

Thanks!
