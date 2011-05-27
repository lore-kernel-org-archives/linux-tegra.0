From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Tegra board updates for 2.6.40
Date: Fri, 27 May 2011 09:24:12 -0700
Message-ID: <BANLkTikFjz6QfsaHsMbzXeLLB8azOcdGBQ@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF0498A4870C@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0498A4870C-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, May 26, 2011 at 11:00 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Colin,
>
> You had mentioned not taking any board updates for Tegra for 2.6.40.
>
> Could you please consider taking at least the following one patch:
>
> http://www.spinics.net/lists/linux-tegra/msg01396.html
>
> This is a simple bug-fix rather than new feature etc. Without this,
> audio on Harmony, which previously worked fine, fails to initialize
> due to the conflicting attempted GPIO registrations. (I *think*
> Harmony still boots OK without the fix, but I vaguely remember
> the fix being needed just to boot, but I'm probably wrong about that)
>
> Thanks!

Sure, I can take bug fixes.
