From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 10/14] ARM: tegra: tegra_powergate_is_powered should be static
Date: Mon, 10 Oct 2011 11:11:20 -0700
Message-ID: <CAOesGMj2q0RjQOKu7hSc=Mhom2u3M2zwcXCMqjcsfgEB2tNKGg@mail.gmail.com>
References: <1317956064-17650-1-git-send-email-olof@lixom.net>
	<1318224484-2090-1-git-send-email-olof@lixom.net>
	<1318224484-2090-11-git-send-email-olof@lixom.net>
	<4E92CC72.3030809@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E92CC72.3030809-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Mon, Oct 10, 2011 at 3:44 AM, Sergei Shtylyov
<sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org> wrote:
> Hello.
>
> On 10-10-2011 9:28, Olof Johansson wrote:
>
>> Not exported and not used externally.
>
>> Also, fix return type =A0and change to instead WARN_ON on bad parame=
ters.
>
> =A0 Change to what? You're changing _to_ WARN_ON() as we can see, not=
 from
> it...

I guess I wasn't entirely clear in the commit message, thanks for
pointing it out.

I revised the text just now when I applied the series -- not really
warranting a repost of the patch though.


Thanks,

-Olof
