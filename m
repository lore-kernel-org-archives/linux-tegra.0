From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/2] irqchip/tegra: Remove everything related to COP
Date: Tue, 13 Aug 2019 18:09:38 +0300
Message-ID: <7005ba67-3815-94cc-c524-ec39023e5164@gmail.com>
References: <20190811183044.13925-1-digetx@gmail.com>
 <86blwtnnwd.wl-maz@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86blwtnnwd.wl-maz@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <maz@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

13.08.2019 17:25, Marc Zyngier пишет:
> On Sun, 11 Aug 2019 19:30:43 +0100,
> Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> There is no point in touching of the COP (ARM7TDMI auxiliary boot/firmware
>> CPU) because COP's interrupts should be related only to an old multimedia
>> firmware that is not applicable to the upstream kernel. Hence let's remove
>> everything related to the COP, for consistency.
> 
> We've had that exact discussion a few weeks ago, and I objected to
> this change as there is no possible way you can know for sure people
> don't use mainline with an old firmware. The whole point of the
> firmware is to be an abstraction for the kernel, for better or worse.

I think you're misunderstanding what kind of firmware it is. It absolutely can't be used
with upstream kernel without of porting the whole downstream driver stack (which is a very
old crusty v3.1 kernel, a typical non-upstreamable downstream hackery). In upstream we now
have a proper DRM graphics driver, video decoder driver and etc. Few years ago those
downstream drivers were obsoleted and not supported by the NVIDIA anymore.

> If you really want to do something useful here, consider detecting
> such firmware (even better, detect the new ones that don't require
> this stuff) and document the various requirements. At least we'll know
> where we stand, because the changes you're making are just as random
> as what we have so far.

As I just said in the above, that old firmware is not usable with the upstream in any shape
or form. Hence there is nothing to detect, it is safe to assume that only newer hardware has
something running in background. Peter De Schrijver suggested that kernel shouldn't touch
the COP's interrupts for the newer firmware, so this patch should be fine if Peter or
somebody else from NVIDIA will give an ACK.
