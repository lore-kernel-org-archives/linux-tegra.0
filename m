From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [RFC PATCH] irqchip: arm-gic: take gic_lock when updating irq
 type
Date: Mon, 26 Mar 2018 15:26:17 +0100
Message-ID: <9acdc1bc-5a8b-4996-4986-9c3fddb2f8b7@arm.com>
References: <c20f41d47ed9444b9050bc1f609d4bbe@bgmail101.nvidia.com>
 <77ac9d88-e99e-c507-66b2-cc14f06ce192@arm.com>
 <20180326131907.3m3sfwxvyzuli2ps@holly.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180326131907.3m3sfwxvyzuli2ps@holly.lan>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Aniruddha Banerjee <aniruddhab@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <treding@nvidia.com>, Vipin Kumar <vipink@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 26/03/18 14:19, Daniel Thompson wrote:
> On Thu, Mar 22, 2018 at 12:19:15PM +0000, Marc Zyngier wrote:
>> On 22/03/18 10:28, Aniruddha Banerjee wrote:
>> [a PGP-encrypted email]
>>
>> Given that you're cc-ing various mailing lists, please resend this email
>> unencrypted.
> 
> I am very puzzled about what is going on here. I could read the 
> original mail fine and I was not in To: or Cc:. It also seems to
> have made it through to the archives OK.
> 
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1645375.html
> https://www.spinics.net/lists/linux-tegra/msg32829.html

It looks like any email I getting from nvidia is encrypted. The message
on the list is in clear text, but not the one I received, hence my
(admittedly premature) rant.

	M.
-- 
Jazz is not dead. It just smells funny...
