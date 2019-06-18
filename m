From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 1/4] staging: media: tegra-vde: Remove BIT() macro
 from UAPI header
Date: Tue, 18 Jun 2019 11:23:13 -0700
Message-ID: <26cd63896d6930385b4f770e305f0782a455a688.camel@perches.com>
References: <20190618161458.20499-1-digetx@gmail.com>
         <20190618161458.20499-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618161458.20499-5-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Johannes Berg <johannes@sipsolutions.net>, Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <jakub.kicinski@netronome.com>, Jesper Dangaard Brouer <hawk@kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2019-06-18 at 19:14 +0300, Dmitry Osipenko wrote:
> The BIT macro isn't available in userspace. Checkpatch complains about
> shifts being used instead of the macro and people are starting to send
> patches without realizing that it's a UAPI header file. Hence let's
> replace the BIT macro with a hex values to make everyone happy.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/staging/media/tegra-vde/uapi.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/uapi.h b/drivers/staging/media/tegra-vde/uapi.h
> index a0dad1ed94ef..dd3e4a8c9f7e 100644
> --- a/drivers/staging/media/tegra-vde/uapi.h
> +++ b/drivers/staging/media/tegra-vde/uapi.h
> @@ -6,8 +6,8 @@
>  #include <linux/types.h>
>  #include <asm/ioctl.h>
>  
> -#define FLAG_B_FRAME		BIT(0)
> -#define FLAG_REFERENCE		BIT(1)
> +#define FLAG_B_FRAME		0x1
> +#define FLAG_REFERENCE		0x2
>  
>  struct tegra_vde_h264_frame {
>  	__s32 y_fd;

The BIT macro is already used quite a bit in uapi headers.
I imagine all those need fixup...

$ git grep -P '\bBIT\s*\(' include/uapi
include/uapi/linux/bpf.h:#define BPF_FIB_LOOKUP_DIRECT  BIT(0)
include/uapi/linux/bpf.h:#define BPF_FIB_LOOKUP_OUTPUT  BIT(1)
include/uapi/linux/coresight-stm.h:#define STM_FLAG_TIMESTAMPED   BIT(3)
include/uapi/linux/coresight-stm.h:#define STM_FLAG_GUARANTEED    BIT(7)
include/uapi/linux/nl80211.h: * bitmask of BIT(NL80211_BAND_*) as described in %enum
include/uapi/linux/pkt_sched.h:#define TC_ETF_DEADLINE_MODE_ON  BIT(0)
include/uapi/linux/pkt_sched.h:#define TC_ETF_OFFLOAD_ON        BIT(1)
include/uapi/linux/psci.h:#define PSCI_1_0_OS_INITIATED                 BIT(0)
include/uapi/linux/serio.h:#define SERIO_TIMEOUT        BIT(0)
include/uapi/linux/serio.h:#define SERIO_PARITY BIT(1)
include/uapi/linux/serio.h:#define SERIO_FRAME  BIT(2)
include/uapi/linux/serio.h:#define SERIO_OOB_DATA       BIT(3)
include/uapi/linux/tc_act/tc_ctinfo.h:  CTINFO_MODE_DSCP        = BIT(0),
include/uapi/linux/tc_act/tc_ctinfo.h:  CTINFO_MODE_CPMARK      = BIT(1)
