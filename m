From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V1] i2c: tegra: disable irq in tegra_i2c_xfer_msg
Date: Tue, 18 Jun 2019 01:53:21 -0700
Message-ID: <93b72301-2132-f9da-b5b8-f2fb3c4163c4@nvidia.com>
References: <1560835386-2865-1-git-send-email-bbiswas@nvidia.com>
 <30d1d048-f474-f1fb-6415-ee6389900032@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <30d1d048-f474-f1fb-6415-ee6389900032@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>, Dmitry Osipenko <digetx@gmail.com>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 6/17/19 11:32 PM, Jon Hunter wrote:
> 
> On 18/06/2019 06:23, Bitan Biswas wrote:
>> Synchronize ISR and tegra_i2c_xfer_msg execution
>> by disabling interrupt. This avoids spinlock usage
>> for same purpose.
> 
> I think that you need to explain the motivation/benefit of this. It is
> not immediately clear to me. Sorry if I have missed some previous
> discussion.
I updated the commit description with details and benefit. Please review 
Patch V2.

-regards,
  Bitan
