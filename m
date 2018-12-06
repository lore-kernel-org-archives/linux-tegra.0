From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v2 2/5] genirq: Export irq_chip_set_wake_parent()
Date: Thu, 6 Dec 2018 13:55:49 +0000
Message-ID: <cd55816a-68da-c7d3-5dc7-bfe0b27c2ad2@arm.com>
References: <20181129170312.23625-1-thierry.reding@gmail.com>
 <20181129170312.23625-3-thierry.reding@gmail.com>
 <CACRpkdbRswRmMWFGuB6pMWeUVdB6=rxqC-o4ytv1VhK-2yjWDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbRswRmMWFGuB6pMWeUVdB6=rxqC-o4ytv1VhK-2yjWDg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 05/12/2018 21:31, Linus Walleij wrote:
> On Thu, Nov 29, 2018 at 6:03 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> 
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Interrupt controllers in a hierarchy want to use this function to
>> propogate ->irq_set_wake() operations to their parent domains.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> 
> Tglx/Marc: is this change OK? (ACK?)

It looks OK to me, as it is consistent with irq_chip_set_type_parent,
among others.

Acked-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny...
