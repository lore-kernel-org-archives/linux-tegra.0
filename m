From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
Date: Thu, 25 Jun 2020 02:11:21 +0300
Message-ID: <c6642ebd-c9f1-eab0-ff6d-109698af73e0@gmail.com>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

23.06.2020 15:09, Mikko Perttunen пишет:
> /* Command is an opcode gather from a GEM handle */
> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER             0
> /* Command is an opcode gather from a user pointer */
> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER_UPTR        1

I'm a bit dubious about whether we really need to retain the non-UPTR
variant. The memory-copying overhead is negligible because cmdstream's
data usually is hot in CPU's cache

IIRC, the most (if not all) of the modern DRM drivers drivers use the
usrptr-only for the cmdstream.

At least there is no any real-world userspace example today that could
benefit from a non-UPTR variant.

I'm suggesting to leave out the non-UPTR gather variant for now, keeping
it in mind as a potential future extension of the submission UAPI. Any
objections?
