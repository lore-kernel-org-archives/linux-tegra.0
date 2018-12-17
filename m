From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH 2/2] Staging: nvec: nvec: fixed check style issues
Date: Mon, 17 Dec 2018 20:48:04 +0100 (CET)
Message-ID: <alpine.OSX.2.21.1812172039250.96577@macbook-pro.fritz.box>
References: <1544979463-10126-1-git-send-email-indigoomega021@gmail.com> <20181217081640.GA16368@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217081640.GA16368@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Amir Mahdi Ghorbanian <indigoomega021@gmail.com>, marvin24@gmx.de, devel@driverdev.osuosl.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org


Hi,

On Mon, 17 Dec 2018, Greg KH wrote:

> On Sun, Dec 16, 2018 at 08:57:43AM -0800, Amir Mahdi Ghorbanian wrote:
>> @@ -626,7 +628,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>>  		break;
>>  	case 2:		/* first byte after command */
>>  		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
>> -			udelay(33);
>> +			usleep_range(0, 33);
>
> Why is this a valid range to sleep for for this device?  Have you been
> able to verify/test this?

oh no, not again. Why does this come up again every half year? This udelay 
is a workaround for a hw bug which only seldom triggers (if it triggers at 
all). Secondly, this is in interrupt context, so *sleep timers are no go, 
afaik.

Marc
