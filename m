From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 09/13] dmaengine: tegra-apb: Remove runtime PM usage
Date: Tue, 7 Jan 2020 15:13:52 +0000
Message-ID: <f63a68cf-bb9d-0e79-23f3-233fc97ca6f9@nvidia.com>
References: <20200106011708.7463-1-digetx@gmail.com>
 <20200106011708.7463-10-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106011708.7463-10-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 06/01/2020 01:17, Dmitry Osipenko wrote:
> There is no benefit from runtime PM usage for the APB DMA driver because
> it enables clock at the time of channel's allocation and thus clock stays
> enabled all the time in practice, secondly there is benefit from manually
> disabled clock because hardware auto-gates it during idle by itself.

This assumes that the channel is allocated during a driver
initialisation. That may not always be the case. I believe audio is one
case where channels are requested at the start of audio playback.

Jon

-- 
nvpublic
