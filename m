From: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 06/22] drm/tegra: dc: Avoid reset asserts on Tegra20
Date: Wed, 14 Jun 2017 09:13:53 +0200
Message-ID: <CABPQNSZuiZenNN2Ypz1UGxX2qyKvTdxRM_DYTbCgUnNKwywHkg@mail.gmail.com>
References: <cover.1497394243.git.digetx@gmail.com> <1c7b0c7bf713401073d648f9f228fa152c094a5a.1497394243.git.digetx@gmail.com>
Reply-To: kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1c7b0c7bf713401073d648f9f228fa152c094a5a.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 14, 2017 at 1:15 AM, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Commit 33a8eb8 ("Implement runtime PM") introduced HW reset control. It
> causes a hang on Tegra20 if both display controllers are utilized (RGB
> panel and HDMI). The TRM suggests that each display controller has its own
> reset control, apparently it is not correct.
>
> Fixes: 33a8eb8d40ee ("drm/tegra: dc: Implement runtime PM")
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
