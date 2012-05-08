From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Regression due to d29f3ef "tty_lock: Localise the lock"
Date: Tue, 08 May 2012 09:46:51 -0600
Message-ID: <4FA93FEB.2060200@wwwdotorg.org>
References: <4FA8557E.5080402@wwwdotorg.org> <20120508103512.42db1c4b@pyramind.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120508103512.42db1c4b-38n7/U1jhRXW96NNrWNlrekiAK3p4hvP@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Cc: Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/08/2012 03:35 AM, Alan Cox wrote:
> On Mon, 07 May 2012 17:06:38 -0600
> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> 
>> Alan,
>>
>> Commit d29f3ef "tty_lock: Localise the lock" appears to cause a problem
>> for me.
>>
>> With this commit (as in next-20120507), I can no longer log into my
>> system (NVIDIA Tegra device with ARM CPU) over the serial console, since
>> the login prompt no longer appears. If I wait a few minutes, I see the
>> following console spew:
> 
> Eep. If it's reproducable can you test whether adding the unlock/relock
> in drivers/tty/pty.c does the trick ?
> 
> ie:
> 	tty_unlock(tty);
> 	tty_vhangup(tty);
> 	tty_lock(tty);

Yes, that change in pty_close() solves the problem.

> or if changing it for tty_hangup(tty) does it.

Assuming that means s/tty_vhangup/tty_hangup/ in pty_close(), then yes
that fixes it too.

Thanks.
