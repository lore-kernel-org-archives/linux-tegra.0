From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Subject: Re: [PATCH v3] dma-buf: cleanup dma_buf_export() to make it easily
 extensible
Date: Wed, 28 Jan 2015 11:23:39 -0200
Message-ID: <20150128112339.164c55fd@recife.lan>
References: <1422449643-7829-1-git-send-email-sumit.semwal@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1422449643-7829-1-git-send-email-sumit.semwal@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: inki.dae@samsung.com, linaro-kernel@lists.linaro.org, pawel@osciak.com, airlied@linux.ie, gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, robdclark@gmail.com, kgene@kernel.org, thierry.reding@gmail.com, daniel@ffwll.ch, daniel.vetter@intel.com, linux-tegra@vger.kernel.org, rmk+kernel@arm.linux.org.uk, m.szyprowski@samsung.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Em Wed, 28 Jan 2015 18:24:03 +0530
Sumit Semwal <sumit.semwal@linaro.org> escreveu:

> +/**
> + * helper macro for exporters; zeros and fills in most common values
> + */
> +#define DEFINE_DMA_BUF_EXPORT_INFO(a)	\
> +	struct dma_buf_export_info a = { .exp_name = KBUILD_MODNAME }
> +

I suspect that this will let the other fields not initialized.

You likely need to do:

#define DEFINE_DMA_BUF_EXPORT_INFO(a)	\
	struct dma_buf_export_info a = { 	\
	.exp_name = KBUILD_MODNAME;		\
	.fields = 0;				\
...
}

Regards,
Mauro
