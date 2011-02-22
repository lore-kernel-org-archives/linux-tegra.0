From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 7/7] ARM: tegra: clock: Disable clocks left on by bootloader
Date: Tue, 22 Feb 2011 07:30:35 -0800
Message-ID: <AANLkTinm70LbG8-H7RHndOzkP9vcnu5GhnhKh_LHSzaP@mail.gmail.com>
References: <1298342392-21236-1-git-send-email-ccross@android.com>
	<1298342392-21236-8-git-send-email-ccross@android.com>
	<AANLkTikNSEyjdL0Lchmm-bFxD00omkGLq6Q6Yyjy51Ov@mail.gmail.com>
	<AANLkTi==wykFCCjamRNh2ngEaubgeLqmZ7Mv9OsH=0cL@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi==wykFCCjamRNh2ngEaubgeLqmZ7Mv9OsH=0cL-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Tue, Feb 22, 2011 at 12:05 AM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrot=
e:

> It doesn't need to be an early_param, I can make it a __setup.

Sounds good.

>> Also, Documentation/kernel-parameters.txt should be updated with it.
> Is it really worth adding every debug flag on every platform to
> kernel-parametes.txt? =A0I could add the flag to the warning message
> instead.

It looks like most arm sub-archs haven't added theirs, so it's OK to
leave out. I'm not too bothered either way myself.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
