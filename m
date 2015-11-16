From: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add NVIDIA Tegra XUSB pad controller
 binding
Date: Mon, 16 Nov 2015 09:12:37 +0000
Message-ID: <56499E05.8050301@collabora.co.uk>
References: <1446657109-15568-1-git-send-email-thierry.reding@gmail.com> <1446657109-15568-2-git-send-email-thierry.reding@gmail.com> <563A7077.20902@wwwdotorg.org> <20151113161138.GA7219@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151113161138.GA7219@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 13/11/15 16:11, Thierry Reding wrote:
> On Wed, Nov 04, 2015 at 01:54:15PM -0700, Stephen Warren wrote:
>> On 11/04/2015 10:11 AM, Thierry Reding wrote:
>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> +- mboxes: Must contain an entry for each entry in mbox-names.
>>> +- mbox-names: Must include the following entries:
>>> +  - "xusb"
>> I thought we'd decided not to use any mbox binding or drivers in XUSB now?
>> See for example my proposed XUSB controller binding at:
>>
>> http://www.spinics.net/lists/linux-tegra/msg23922.html
>> [PATCH V9] dt: add NVIDIA Tegra XUSB controller binding
>>
>> The idea is that the mailbox should be entirely internal to the XUSB
>> controller driver, and if the receipt of a mailbox message requires any
>> change in the XUSB pad controller programming, the XUSB controller driver
>> should simply call the XUSB pad controller driver to perform that operation.
> Okay, I think that should work, but it'll require a rather large rewrite
> of... well, everything. I think Martyn was going to look into that, so I
> guess I'll just drop this for now.
>
Unfortunately I've been shifted onto other things now,

Martyn
