From: Andrey Danin <danindrey@mail.ru>
Subject: Re: [RFC 0/9] i2c: slave: improve i2c client address spaces and their
 DT support
Date: Mon, 20 Jul 2015 10:23:04 +0300
Message-ID: <55ACA1D8.6010403@mail.ru>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
Sender: linux-sh-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc: linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello Wolfram,

On 17.07.2015 17:08, Wolfram Sang wrote:
> As promised here is my RFC to improve address spaces for I2C. This should give
> i2c seperate address spaces for standard clients, 10 bit clients, and our own
> slave clients. So, you can now have a 7 bit slave at 0x50 and a 10 bit slave at
> 0x050. Or, you can have a slave driver listening at some address and at the
> same time have a client driver talking to this address. Note that this is only
> the core support for that separation, I am still not sure if there is hardware
> being able talking to its own slave address, but we will see.
>
> This RFC and while I did some quick tests, it is not thoroughly tested. But I
> wanted to push it out before I leave the computer for the weekend. It still
> shows what path I chose to solve the problem. So, comments on that and further
> testing are more than welcome!
>
> BTW Andrey, I did not modify your patch and couldn't get the i2c-slave-eeprom driver
> to work with my Jetson TK1. Does this work for you?
>
> Thanks,
>
>     Wolfram
>

Thanks for the patches. Slave mode works for me.

The series looks good. Only hardcoded values in patch 4 confuse me a little.
