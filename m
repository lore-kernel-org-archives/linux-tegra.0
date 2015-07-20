From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC 9/9] dts: tegra: WIP: hack dts to test new dt flags for
 i2c
Date: Mon, 20 Jul 2015 16:09:42 -0600
Message-ID: <55AD71A6.4030105@wwwdotorg.org>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de> <1437142109-31975-10-git-send-email-wsa@the-dreams.de> <3764937.mMMXIHUnrR@avalon> <20150720084557.GA2551@katana> <CAL_JsqKAoydzJ5KOKJTByB9kOQ8KrSX99hVYNkm6FnOZ33xN1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKAoydzJ5KOKJTByB9kOQ8KrSX99hVYNkm6FnOZ33xN1w@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, SH-Linux <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrey Danin <danindrey@mail.ru>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 07/20/2015 10:10 AM, Rob Herring wrote:
> On Mon, Jul 20, 2015 at 3:45 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>>
>>>> +
>>>> +           eeprom@42 {
>>>> +                   compatible = "linux,slave-24c02";
>>>> +                   //FIXME: Should be I2C_OWN_SLAVE_ADDRESS | 0x42
>>>> +                   reg = <0xc0000042>;
>>>
>>> The node name doesn't match the reg property anymore. Isn't that considered as
>>> a problem ?
>>
>> Hmm, true. So far, Rob (CCed) was fine with this approach:
>> http://www.spinics.net/lists/linux-tegra/msg22760.html
>>
>> @Rob: If we introduce flag bits in the MSBs of an I2C address, the reg
>> property is different from the node name. Is this a problem?
>
> No, I don't it is a problem.

The rule so far has been that the unit address (the value in the node 
name) must match the first value in the reg property. I don't see why 
this rule should change. To solve this, just name the node 
eeprom@c0000042 (or eeprom@40000042 with the correction pointed out 
earlier in the thread).
