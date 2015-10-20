From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] pinctrl: tegra-xusb: Correct lane mux options
Date: Tue, 20 Oct 2015 10:08:29 -0600
Message-ID: <562666FD.1020902@wwwdotorg.org>
References: <1444987441-25176-1-git-send-email-jonathanh@nvidia.com>
 <56212308.7050405@wwwdotorg.org> <56262563.3020201@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56262563.3020201@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 10/20/2015 05:28 AM, Jon Hunter wrote:
>
> On 16/10/15 17:17, Stephen Warren wrote:
>> On 10/16/2015 03:24 AM, Jon Hunter wrote:
>>> The description of the XUSB_PADCTL_USB3_PAD_MUX_0 register in the
>>> Tegra124
>>> documentation implies that all functions (pcie, usb3 and sata) can be
>>> muxed onto to all lanes (pcie lanes 0-4 and sata lane 0). However, it has
>>> been confirmed that this is not the case and the mux'ing options much
>>> more
>>> limited. Unfortunately, the public documentation has not been updated to
>>> reflect this and so detail the actual mux'ing options here by function:
>>
>> FWIW, there's better documentation of this in the Tegra210 TRM, although
>> the options have been expanded on that chip, so the docs don't entirely
>> apply to Tegra124.
>>
>>> Function:        Lanes:
>>> pcie1 x2:        pcie3, pcie4
>>> pcie1 x4:        pcie1, pcie2, pcie3, pcie4
>>> pcie2 x1 (option1):    pcie0
>>> pcie2 x1 (option2):    pcie2
>>> usb3 port 0:        pcie0
>>> usb3 port 1 (option 1):    pcie1
>>> usb3 port 1 (option 2):    sata0
>>> sata:            sata0
>>
>> I think this change needs a DT binding change to go along with it. Can
>> you take a look at:
>>
>> http://www.spinics.net/lists/arm-kernel/msg449647.html
>> [PATCH 1/2] dt: update Tegra XUSB padctl binding for Tegra210
>
> I took a look at the above and it looks fine to me. Do you want me to
> put the above info into the DT binding doc? I am not sure that we need
> to update the binding itself.

Hmm. I guess there /should/ be no need for the DT bindings to list out 
all the valid combinations; it should just say "go read the HW docs". Of 
course as you mentioned our HW docs aren't quite as complete as they 
should be in this area, but still solving that in the DT binding doc may 
not be the best approach. But then again, the DT binding doc already 
lists which functions are valid for which groups of pins, but perhaps 
that's more about understanding the structure of the binding than the HW.

I guess I'll leave it up to you which way to go. Perhaps let's not 
pursue adding this to the binding doc until we get the PHY-per-lane 
changes in place or rejected or the two changes will conflict badly?
