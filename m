From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1] partitions/efi: Add 'gpt_sector' kernel cmdline parameter
Date: Wed, 19 Feb 2020 17:26:57 +0100
Message-ID: <CAKv+Gu9vOh5vmHTGLYA9nszQfGq-yMRPvyYUhSzwcYJD+ZYKHA@mail.gmail.com>
References: <20200219162339.16192-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200219162339.16192-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-efi <linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Doc Mailing List <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 19 Feb 2020 at 17:25, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> The gpt_sector=<sector> causes the GPT partition search to look at the
> specified sector for a valid GPT header if the GPT is not found at the
> beginning or the end of block device.
>
> In particular this is needed for NVIDIA Tegra consumer-grade Android
> devices in order to make them usable with the upstream kernel because
> these devices use a proprietary / closed-source partition table format
> for the EMMC and it's impossible to change the partition's format. Luckily
> there is a GPT table in addition to the proprietary table, which is placed
> in uncommon location of the EMMC storage and bootloader passes the
> location to kernel using "gpt gpt_sector=<sector>" cmdline parameters.
>
> This patch is based on the original work done by Colin Cross for the
> downstream Android kernel.
>
> Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Which block device is this parameter applied to?

> ---
>  Documentation/admin-guide/kernel-parameters.txt |  5 +++++
>  block/partitions/efi.c                          | 15 +++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 50138e6826a1..ee4781daa379 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1382,6 +1382,11 @@
>                         primary GPT is corrupted, it enables the backup/alternate
>                         GPT to be used instead.
>
> +       gpt_sector      [EFI] Forces GPT partition search to look at the
> +                       specified sector for a valid GPT header if the GPT is
> +                       not found at the beginning or the end of the block
> +                       device.
> +
>         grcan.enable0=  [HW] Configuration of physical interface 0. Determines
>                         the "Enable 0" bit of the configuration register.
>                         Format: 0 | 1
> diff --git a/block/partitions/efi.c b/block/partitions/efi.c
> index db2fef7dfc47..0c8926d76d7a 100644
> --- a/block/partitions/efi.c
> +++ b/block/partitions/efi.c
> @@ -103,6 +103,17 @@ force_gpt_fn(char *str)
>  }
>  __setup("gpt", force_gpt_fn);
>
> +/* This allows a kernel command line option 'gpt_sector=<sector>' to
> + * enable GPT header lookup at a non-standard location.
> + */
> +static u64 force_gpt_sector;
> +static int __init
> +force_gpt_sector_fn(char *str)
> +{
> +       WARN_ON(kstrtoull(str, 10, &force_gpt_sector) < 0);
> +       return 1;
> +}
> +__setup("gpt_sector=", force_gpt_sector_fn);
>
>  /**
>   * efi_crc32() - EFI version of crc32 function
> @@ -621,6 +632,10 @@ static int find_valid_gpt(struct parsed_partitions *state, gpt_header **gpt,
>          if (!good_agpt && force_gpt)
>                  good_agpt = is_gpt_valid(state, lastlba, &agpt, &aptes);
>
> +       if (!good_agpt && force_gpt && force_gpt_sector)
> +               good_agpt = is_gpt_valid(state, force_gpt_sector,
> +                                        &agpt, &aptes);
> +
>          /* The obviously unsuccessful case */
>          if (!good_pgpt && !good_agpt)
>                  goto fail;
> --
> 2.24.0
>
