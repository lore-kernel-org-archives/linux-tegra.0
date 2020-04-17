From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 2/3] soc/tegra: fuse: Correct Tegra194 revision
Date: Fri, 17 Apr 2020 12:45:07 +0100
Message-ID: <b4458eb2-192a-b5a3-8255-e42f9fc52c1a@nvidia.com>
References: <20200331103341.19571-1-jonathanh@nvidia.com>
 <20200331103341.19571-2-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200331103341.19571-2-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 31/03/2020 11:33, Jon Hunter wrote:
> Determining the revision for Tegra194 devices is slightly different from
> previous generations. For Tegra194, the majorrev field of the HIDREV
> register determines if the major revision is A, B, C, etc and the
> minorrev field determines if the minorrev is 01, 02, 03, etc.
> 
> For Tegra194, there are two main revisions which are A01 and A02.
> Therefore, add a new function to correctly identify the revision for
> Tegra194 devices.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra20.c  |  3 ++-
>  drivers/soc/tegra/fuse/fuse-tegra30.c  |  8 ++++++-
>  drivers/soc/tegra/fuse/fuse.h          |  2 ++
>  drivers/soc/tegra/fuse/tegra-apbmisc.c | 29 ++++++++++++++++++++++++++
>  4 files changed, 40 insertions(+), 2 deletions(-)

Although there is a slight difference, it turns out that the existing
code does work fine for Tegra194 as well and so I will drop this change
as it is not needed.

Jon

-- 
nvpublic
