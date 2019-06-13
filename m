From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V5 6/7] i2c: tegra: fix PIO rx/tx residual transfer check
Date: Thu, 13 Jun 2019 17:22:31 +0530
Message-ID: <5841fe57-fe68-aab3-670c-26b40a5d46ae@nvidia.com>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
 <20190612102458.liieiohnprfyyvs6@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612102458.liieiohnprfyyvs6@ninjato>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Bitan Biswas <bbiswas@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Dmitry Osipenko <digetx@gmail.com>, Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On Wednesday 12 June 2019 03:54 PM, Wolfram Sang wrote:
> On Tue, Jun 11, 2019 at 03:51:13AM -0700, Bitan Biswas wrote:
>> Fix expression for residual bytes(less than word) transfer
>> in I2C PIO mode RX/TX.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> I applied patches 1-5 to my for-next tree now. No need to resend them
> anymore, you can focus on the remaining patches now.
>
> Question: The nominal maintainer for this driver is
>
>          Laxman Dewangan <ldewangan@nvidia.com> (supporter:TEGRA I2C DRIVER)
>
> I wonder if he is still around and interested?
>
> That aside, thanks a lot Dmitry for the review of this series!
>
Most of patches are coming from the downstream as part of upstream 
effort. Hence not reviewing explicitly.
