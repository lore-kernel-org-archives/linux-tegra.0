From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 5/5] ARM: Tegra: Enable Harmony audio support
Date: Wed, 23 Feb 2011 13:24:41 -0800
Message-ID: <AANLkTinzVinbW_rDt5Rqe7i68P2u_XvDvRWA8R2mq0_9@mail.gmail.com>
References: <1298487532-5000-1-git-send-email-swarren@nvidia.com>
	<1298487532-5000-6-git-send-email-swarren@nvidia.com>
	<AANLkTimffVNK2EmTqypQcrWHLisf3c8_dMsHwSbv-nWi@mail.gmail.com>
	<AANLkTi=tDJvfEFFvXGEkZswRWekRLuz4rBoT-0hgobgn@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AANLkTi=tDJvfEFFvXGEkZswRWekRLuz4rBoT-0hgobgn@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Colin Cross <ccross@android.com>
Cc: linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, konkers@android.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 23, 2011 at 1:21 PM, Colin Cross <ccross@android.com> wrote:
> On Wed, Feb 23, 2011 at 1:08 PM, Olof Johansson <olof@lixom.net> wrote:
>> Stephen,
>>
>> Since this depends on i2c, and registers one of the adapters to do it,
>> we should just get the adapters registered separately (all of them)
>> before this. I was holding off that part of board code since the i2c
>> driver went up that maintainer path instead, but if Colin pulls it
>> into tegra for-next, then I'll go ahead with those peices as well.
>
> I'll merge the i2c-tegra branch into for-next (assuming Ben doesn't
> object to it), and you can put all the i2c devices in your pull
> request. =A0That way we can get everything except this patch into the
> first pull request to Linus, and just put this patch into a second
> pull request once the ASoC branch is merged.

Sure, that works. I'll stage the i2c changes tonight.


-Olof
