From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3] get_maintainer: use filename-only regex match for
 Tegra
Date: Mon, 11 Mar 2013 16:05:17 -0600
Message-ID: <513E551D.1070402@wwwdotorg.org>
References: <1363033149-7839-1-git-send-email-swarren@wwwdotorg.org> <CA+GA0_sCXOScRTJMiuz1NkP6uGaB6kkVD4qG+WaOFRyAB-r2NA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+GA0_sCXOScRTJMiuz1NkP6uGaB6kkVD4qG+WaOFRyAB-r2NA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TWFyY2luIMWabHVzYXJ6?= <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/11/2013 03:36 PM, Marcin =C5=9Alusarz wrote:
>=20
> 11 mar 2013 21:19, "Stephen Warren" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
> <mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>> napisa=C5=82(a):
>> Create a new N: entry type in MAINTAINERS which performs a regex mat=
ch
>> against filenames; either those extracted from patch +++ or --- line=
s,
>> or those specified on the command-line using the -f option.

>> diff --git a/MAINTAINERS b/MAINTAINERS

>> +       N: Files and directories with regex patterns.
>> +          N:   [^a-z]tegra     all files whose patch contains the w=
ord tegra
>=20
> s/patch/path/ ?

It looks like Andrew has fixed this up himself. Thanks very much!
