From: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/6] ARM: tegra: remove stale nvidia atag handler
Date: Mon, 21 Feb 2011 15:01:23 -0800
Message-ID: <AANLkTi=SherCg=hfN3Tm2_W4Et=8xk3pF5nQuBPg9h3P@mail.gmail.com>
References: <1298315206-8887-1-git-send-email-olof@lixom.net>
	<1298315206-8887-4-git-send-email-olof@lixom.net>
	<AANLkTinMsDjHwkBFbM7Wb3+QA7Bp83D8-u+vSRDkVwhU@mail.gmail.com>
	<AANLkTinbq4FiZh8sZmzPOVRoN8UzD7C=Gz+thkeZnNAF@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinbq4FiZh8sZmzPOVRoN8UzD7C=Gz+thkeZnNAF-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 21, 2011 at 12:40 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Mon, Feb 21, 2011 at 11:31 AM, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote:
>> Does the kernel still print an unknown atag message without this handler?
>> Is worth keeping an empty handler around to keep that from printing?
>
> With what firmware? u-boot doesn't pass many handlers at all.
> Shouldn't fastboot be changed to not pass it, if it's not used?
>
> (In other words, maybe it makes sense to keep it in android-tegra, but
> not upstream)?

My experience was with nvidia's bootloader that came on the harmony
boards.  Have they switched to u-boot?

FWIW fastboot is just a USB bootloader protocol.  The linux boot code
is (or at least should be) independent in a bootloader.

-Erik
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
