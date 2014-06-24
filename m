From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] ARM: tegra: roth: enable input on mmc clock pins
Date: Tue, 24 Jun 2014 09:53:45 -0600
Message-ID: <53A99F09.1070504@wwwdotorg.org>
References: <1403508779-25896-1-git-send-email-acourbot@nvidia.com> <1403508779-25896-3-git-send-email-acourbot@nvidia.com> <53A87979.6000104@wwwdotorg.org> <53A91026.7040506@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53A91026.7040506@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On 06/23/2014 11:44 PM, Alexandre Courbot wrote:
> On 06/24/2014 04:01 AM, Stephen Warren wrote:
>> On 06/23/2014 01:32 AM, Alexandre Courbot wrote:
>>> Input had been disabled by mistake on these pins, leading to issues with
>>> SDIO devices like the Wifi module not being probed or random errors
>>> occuring on the SD card.
>>
>> I thought the host controller always drove the clock, so there should be
>> no need for the pin's input path to be enabled. Perhaps it depends on
>> the transfer mode (e.g. UHS)?
> 
> That's what I thought too, so I went against what was done downstream
> and disabled input mode. Eventually noticed various issues with MMC
> devices, reverted to the downstream settings and noticed my problems
> were solved by this single change.

Hmm. That's odd. Can you talk to one of the HW engineers behind the
SDHCI controller and get a definitive answer. Thanks.
