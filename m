From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] i2c: tegra: Add delay before reset the controller
Date: Fri, 23 Dec 2011 16:50:00 +0530
Message-ID: <96C9D994977DD0439FB6D3FE3B13DD907DBD3A93D3@BGMAIL01.nvidia.com>
References: <1324550480-26308-1-git-send-email-alokc@nvidia.com>
 <CAOesGMire-13yiA9gVQYFWdTa6ZLJLbTW8qoRoPMRQ1ExavVUQ@mail.gmail.com>
 <7A0BFCFE3DA5CD47B0FB7984326F201A134F2CCC73@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7A0BFCFE3DA5CD47B0FB7984326F201A134F2CCC73-kdsAE/FnitNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org" <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: Alok Chauhan
> 
> Hi,
> 
> (Adding Laxman Dewangan)
> 
> >This change causes problems systems with some models of i2c TPMs, since the
> first transaction to them will always time out (TPM quirk), and the delay
> means that the tpm will have time to go back to sleep and thus timeout >even
> on the retry. So you'll never make progress.
> Working on this.
> 
> -Alok
> 
> 
> -----Original Message-----
> From: Olof Johansson [mailto:olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org]
> Sent: Friday, December 23, 2011 2:48 AM
> To: Alok Chauhan
> Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org; ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org; Stephen Warren;
> bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org; paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org; linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
> Subject: Re: [PATCH] i2c: tegra: Add delay before reset the controller
> 
> Hi,
> 
> (Adding linux-tegra and Dylan Reid who was debugging this before)
> 
> On Thu, Dec 22, 2011 at 2:41 AM, Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > From: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > In NACK error condition, I2C controller violates clock-to-data setup
> > time before stop. In Software, because of this reset of controller is
> > happening before I2C controller could complete STOP condition.
> >
> > Added worst case delay of 1 ms (assuming lowest clock frequency will
> > be 1 KHZ) before reset the controller in case of NACK error.
> 
> This change causes problems systems with some models of i2c TPMs, since the
> first transaction to them will always time out (TPM quirk), and the delay
> means that the tpm will have time to go back to sleep and thus timeout even on
> the retry. So you'll never make progress.
> 
> In other words: this patch will break some systems and thus shouldn't be
> applied.
> 
I think the  delay should be calculated based on speed. So if it is 100KHz, then
delay is 10mcro second for 1 bit. We should wait for 2 bit (ack clock to be complete and
stop pulse to be transmitted).
This patch will make sure that i2c driver will not break the specs i.e. in case of NACK error, the stop
signal should be completed by i2c controller before resetting controller.
I will prefer of having the udelay(2*1000000/speed).

> 
> -Olof
