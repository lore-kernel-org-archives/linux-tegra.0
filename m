From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: Tegra freezes when touching ungated MMIO regions
Date: Thu, 1 Dec 2016 18:57:03 +0200
Message-ID: <f6c3e818-f828-276c-961c-9d61bf4990cd@kapsi.fi>
References: <1f501c0b-0a6a-39b4-208a-509a606ff3fe@oth-regensburg.de>
 <c94b6cbe-86e2-f960-bb0d-d0171655e6dd@wwwdotorg.org>
 <aa11510a-9b59-a8f8-61af-9d6d7c3a13a7@oth-regensburg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <jailhouse-dev+bncBC553EOF3UFBBZFMQHBAKGQEF5GEVOA@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
In-Reply-To: <aa11510a-9b59-a8f8-61af-9d6d7c3a13a7@oth-regensburg.de>
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, Jailhouse <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>, =?UTF-8?Q?Andreas_K=c3=b6lbl?= <andreas.koelbl@st.oth-regensburg.de>
List-Id: linux-tegra@vger.kernel.org

On 12/01/2016 06:47 PM, Ralf Ramsauer wrote:
> Hi Stephen,
>
> On 12/01/2016 05:04 PM, Stephen Warren wrote:
>> On 12/01/2016 07:15 AM, Ralf Ramsauer wrote:
>>> Hi,
>>>
>>> I observed that touching MMIO regions of Tegra devices with its
>>> corresponding clock gate deactivated immediately freezes the whole
>>> system. No kernel panic, nothing.
>>>
>>> I tested this behavior with a small kernel module, find it attached. A
>>> few seconds after loading this module, the whole device freezes. Tested
>>> this on a TK1 and TX1.
>>
>> Unfortunately, this is indeed the way the HW works.
> That's no good news :(
>
> Do you know if this applies to the whole Tegra architecture or only to
> some boards?

It does apply to the whole architecture for all revisions pre-Tegra186 
(which is newer than Tegra210 despite the number).

- Mikko

>>
>>> What is the actual expected behavior on ARM(64) when touching ungated
>>> MMIO regions? Is it specified somewhere?
>>
>> I don't believe the ARM architecture specifies behaviour in this case,
>> or if it does, defines it as implementation defined, which means that
>> pretty much any behaviour is valid.
> I tested the same scenario on another ARM64 board (LeMaker HiKey), which
> did (fortunately) not freeze.
>
>   Ralf
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
