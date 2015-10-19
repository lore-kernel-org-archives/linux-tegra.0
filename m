From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] pinctrl: tegra-xusb: Correct lane mux options
Date: Mon, 19 Oct 2015 12:41:43 +0100
Message-ID: <5624D6F7.6020906@nvidia.com>
References: <1444987441-25176-1-git-send-email-jonathanh@nvidia.com>
 <56212308.7050405@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56212308.7050405@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 16/10/15 17:17, Stephen Warren wrote:
> On 10/16/2015 03:24 AM, Jon Hunter wrote:
>> The description of the XUSB_PADCTL_USB3_PAD_MUX_0 register in the
>> Tegra124
>> documentation implies that all functions (pcie, usb3 and sata) can be
>> muxed onto to all lanes (pcie lanes 0-4 and sata lane 0). However, it has
>> been confirmed that this is not the case and the mux'ing options much
>> more
>> limited. Unfortunately, the public documentation has not been updated to
>> reflect this and so detail the actual mux'ing options here by function:
> 
> FWIW, there's better documentation of this in the Tegra210 TRM, although
> the options have been expanded on that chip, so the docs don't entirely
> apply to Tegra124.

Yes I have been trying to get this better documented.

>> Function:        Lanes:
>> pcie1 x2:        pcie3, pcie4
>> pcie1 x4:        pcie1, pcie2, pcie3, pcie4
>> pcie2 x1 (option1):    pcie0
>> pcie2 x1 (option2):    pcie2
>> usb3 port 0:        pcie0
>> usb3 port 1 (option 1):    pcie1
>> usb3 port 1 (option 2):    sata0
>> sata:            sata0
> 
> I think this change needs a DT binding change to go along with it. Can
> you take a look at:
> 
> http://www.spinics.net/lists/arm-kernel/msg449647.html
> [PATCH 1/2] dt: update Tegra XUSB padctl binding for Tegra210
>
> (Sorry, I didn't realize anyone other than Thierry and Andrew were
> working on XUSB/padctl so didn't explicitly CC you on that.)
> 
> ... to see what would need to be changed there? Or from a binding
> perspective should we simply assume that people will refer to the HW
> docs (or other information sources) for the exact list of available
> options?

Yes may be the above needs to go in the binding doc. For t124, I don't
think that the TRM will get updated now.

Jon
