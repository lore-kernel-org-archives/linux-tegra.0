From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 1/4] staging: media: tegra-vde: Remove BIT() macro
 from UAPI header
Date: Tue, 18 Jun 2019 11:44:47 -0700
Message-ID: <1d206e92d9882865c11016d315f8edcd4344cbb8.camel@perches.com>
References: <20190618161458.20499-1-digetx@gmail.com>
 <20190618161458.20499-5-digetx@gmail.com>
 <26cd63896d6930385b4f770e305f0782a455a688.camel@perches.com>
 <e5b8756590260b4d6a26cf9f02deb9d157cfca83.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <e5b8756590260b4d6a26cf9f02deb9d157cfca83.camel@sipsolutions.net>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Johannes Berg <johannes@sipsolutions.net>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Song Liu <songliubraving@fb.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Jiri Pirko <jiri@resnulli.us>, Alexandre Torgue <alexandre.torgue@st.com>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <jakub.kicinski@netronome.com>, John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org, Jamal Hadi Salim <jhs@mojatatu.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Cong Wang <xiyou.wangcong@gmail.com>, linux-tegra@vger.kernel.org, Yonghong Song <yhs@fb.com>, Mark Rutland <mark.rutland@arm.com>, Martin KaFai Lau <kafai@fb.com>, Jesper Dangaard Brouer <hawk@kernel.org>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 2019-06-18 at 20:37 +0200, Johannes Berg wrote:
> On Tue, 2019-06-18 at 11:23 -0700, Joe Perches wrote:
> > include/uapi/linux/nl80211.h: * bitmask of BIT(NL80211_BAND_*) as described in %enum
> > 
> > 
> That's a comment :P

That's true and that's nice.

It was a casual grep and the comment should
probably be improved anyway.

<insert appropriate emoji here>

cheers, Joe
