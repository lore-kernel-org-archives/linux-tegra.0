From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v6 12/16] dmaengine: tegra-apb: Clean up suspend-resume
Date: Thu, 30 Jan 2020 19:00:37 +0000
Message-ID: <3507dcb9-4a92-8145-1953-e40960604661@nvidia.com>
References: <20200130043804.32243-1-digetx@gmail.com>
 <20200130043804.32243-13-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200130043804.32243-13-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 30/01/2020 04:38, Dmitry Osipenko wrote:
> It is enough to check whether hardware is busy on suspend and to reset
> it across of suspend-resume because channel's configuration is fully
> re-programmed on each DMA transaction anyways and because save-restore
> of an active channel won't end up well without pausing transfer prior to
> saving of the state (note that all channels shall be idling at the time of
> suspend, so save-restore is not needed at all).

Maybe just update the commit message to state that the pause callback is
not implemented and channel pause is not supported prior to T114. And
then ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon
