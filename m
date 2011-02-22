From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: tegra: common device resources
Date: Mon, 21 Feb 2011 20:26:26 -0800
Message-ID: <AANLkTikBxJtaKz4mmrVXhVZT1cxqOsBBbRP=QstAbDs6@mail.gmail.com>
References: <1298315206-8887-1-git-send-email-olof@lixom.net>
	<1298315206-8887-3-git-send-email-olof@lixom.net>
	<AANLkTi=o+n5AYOOrjvr6OFaciLGd4tdC=bPjH1BRcGr3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=o+n5AYOOrjvr6OFaciLGd4tdC=bPjH1BRcGr3-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 21, 2011 at 6:49 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote:
> On Mon, Feb 21, 2011 at 11:06 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>> Add a common location to register resources for used on-chip devices
>> that are commonly configured on boards. Devices will be added to this file
>> as more drivers are added that can make use of them.
>>
>> This is based on work contributed by several people, most of it from
>> Colin Cross and Erik Gilling.
>>
>> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
>
> Acked-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
>
> This patch includes the tegra_uart devices for which the driver is not
> upstream, as well as the i2c devices that will hopefully be in 2.6.39
> but have not been accepted yet, but I guess the devices might as well
> go in now.

Right -- for some of the drivers that are pending, or at least likely
to show up sometime soon, I kept the device definitions in. The only
ones I took out from the out-of-tree version was graphics and audio,
since Stephen is adding the audio ones back with his work.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
