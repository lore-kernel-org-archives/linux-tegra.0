From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] pinctrl: tegra-xusb: Correct lane mux options
Date: Fri, 23 Oct 2015 08:22:56 +0100
Message-ID: <5629E050.50100@nvidia.com>
References: <1444987441-25176-1-git-send-email-jonathanh@nvidia.com>
 <56212308.7050405@wwwdotorg.org> <56262563.3020201@nvidia.com>
 <562666FD.1020902@wwwdotorg.org> <562681CA.4060307@nvidia.com>
 <5626899C.6050804@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <5626899C.6050804@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 20/10/15 19:36, Stephen Warren wrote:
> On 10/20/2015 12:02 PM, Jon Hunter wrote:
>>
>> On 20/10/15 17:08, Stephen Warren wrote:
>>> On 10/20/2015 05:28 AM, Jon Hunter wrote:
>>>>
>>>> On 16/10/15 17:17, Stephen Warren wrote:
>>>>> On 10/16/2015 03:24 AM, Jon Hunter wrote:
>>>>>> The description of the XUSB_PADCTL_USB3_PAD_MUX_0 register in the
>>>>>> Tegra124
>>>>>> documentation implies that all functions (pcie, usb3 and sata) can be
>>>>>> muxed onto to all lanes (pcie lanes 0-4 and sata lane 0). However,
>>>>>> it has
>>>>>> been confirmed that this is not the case and the mux'ing options much
>>>>>> more
>>>>>> limited. Unfortunately, the public documentation has not been
>>>>>> updated to
>>>>>> reflect this and so detail the actual mux'ing options here by
>>>>>> function:
>>>>>
>>>>> FWIW, there's better documentation of this in the Tegra210 TRM,
>>>>> although
>>>>> the options have been expanded on that chip, so the docs don't
>>>>> entirely
>>>>> apply to Tegra124.
>>>>>
>>>>>> Function:        Lanes:
>>>>>> pcie1 x2:        pcie3, pcie4
>>>>>> pcie1 x4:        pcie1, pcie2, pcie3, pcie4
>>>>>> pcie2 x1 (option1):    pcie0
>>>>>> pcie2 x1 (option2):    pcie2
>>>>>> usb3 port 0:        pcie0
>>>>>> usb3 port 1 (option 1):    pcie1
>>>>>> usb3 port 1 (option 2):    sata0
>>>>>> sata:            sata0

[snip]

>> That's fine with me. Are you ok with this patch as-is going upstream for
>> now?
> 
> Yes, the code change is fine as is.

Care to ACK this so Linus can pick it up?

Cheers
Jon
