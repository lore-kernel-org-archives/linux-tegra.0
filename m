From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/6] video: tegra: Add nvhost driver
Date: Mon, 26 Nov 2012 11:23:10 +0200
Message-ID: <50B334FE.6040801@nvidia.com>
References: <1353586614-7308-1-git-send-email-tbergstrom@nvidia.com> <1353586614-7308-2-git-send-email-tbergstrom@nvidia.com> <20121123123954.GB10090@sivaramn-lnx>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121123123954.GB10090@sivaramn-lnx>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 23.11.2012 14:39, Sivaram Nair wrote:
> Should this be static (considering that the below function exist)?

(...)

All your comments were valid, and I fixed the code. Thanks.

I ended up ripping away the alloc memmgr call and mem_mgr pointers in
functions. We use that call in downstream for allocating an instance of
nvmap, but in dmabuf case there's no client to be allocated, and thus
the calls were empty.

Terje
