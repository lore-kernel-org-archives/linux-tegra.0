From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] tegrarcm: Move miniloader files to "miniloader"
 subdir
Date: Mon, 17 Jun 2013 20:30:46 -0700
Message-ID: <20130618033045.GA2922@badger>
References: <1371525937-2713-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371525937-2713-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 17, 2013 at 08:25:36PM -0700, Allen Martin wrote:
> In preparation of changing the LICENSE file to refer to "miniloader"
> directory instead of individual filenames, move all miniloader files
> into "miniloader" subdir.
> 
> Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  src/Makefile.am                      |    6 +-
>  src/main.c                           |    6 +-
>  src/miniloader/tegra114-miniloader.h | 9616 ++++++++++++++++++++++++++++++++++
>  src/miniloader/tegra20-miniloader.h  | 8323 +++++++++++++++++++++++++++++
>  src/miniloader/tegra30-miniloader.h  | 8070 ++++++++++++++++++++++++++++
>  src/tegra114-miniloader.h            | 9616 ----------------------------------
>  src/tegra20-miniloader.h             | 8323 -----------------------------
>  src/tegra30-miniloader.h             | 8070 ----------------------------
>  8 files changed, 26015 insertions(+), 26015 deletions(-)
>  create mode 100644 src/miniloader/tegra114-miniloader.h
>  create mode 100644 src/miniloader/tegra20-miniloader.h
>  create mode 100644 src/miniloader/tegra30-miniloader.h
>  delete mode 100644 src/tegra114-miniloader.h
>  delete mode 100644 src/tegra20-miniloader.h
>  delete mode 100644 src/tegra30-miniloader.h
> 

Sorry, forgot to generate patch with '-M' :(

-- 
nvpublic
