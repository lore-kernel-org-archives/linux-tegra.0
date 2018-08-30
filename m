From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 03/14] staging: media: tegra-vde: Prepare for interlacing
 support
Date: Thu, 30 Aug 2018 11:56:05 +0300
Message-ID: <20180830085605.dpfsd6korroisfrq@mwanda>
References: <20180813145027.16346-1-thierry.reding@gmail.com>
 <20180813145027.16346-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20180813145027.16346-4-thierry.reding@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 13, 2018 at 04:50:16PM +0200, Thierry Reding wrote:
>  static void tegra_vde_setup_iram_tables(struct tegra_vde *vde,
> +					unsigned int num_ref_pics,
>  					struct video_frame *dpb_frames,
>  					unsigned int ref_frames_nb,
>  					unsigned int with_earlier_poc_nb)
> @@ -251,13 +260,17 @@ static void tegra_vde_setup_iram_tables(struct tegra_vde *vde,
>  	u32 value, aux_addr;
>  	int with_later_poc_nb;
>  	unsigned int i, k;
> +	size_t size;
> +
> +	size = num_ref_pics * 4 * 8;
> +	memset(vde->iram, 0, size);

I can't get behind the magical size calculation...  :(

regards,
dan carpenter
