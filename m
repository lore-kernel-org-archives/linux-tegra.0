From: Colin Cross <ccross@android.com>
Subject: Re: [PATCH] MAINTAINERS: Update tegra maintainer information
Date: Fri, 7 Oct 2011 13:35:52 -0700
Message-ID: <CAMbhsRQtUEx_oh+WMmcDEqMznWyF4p2g54G6tsa8QVVB+BxwuA@mail.gmail.com>
References: <1318019268-6946-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1318019268-6946-1-git-send-email-olof@lixom.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Stephen Warren <swarren@nvidia.com>, Erik Gilling <konkers@android.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, torvalds@linux-foundation.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 7, 2011 at 1:27 PM, Olof Johansson <olof@lixom.net> wrote:
> A couple of changes to the Tegra maintainership setup:
>
> I'm very glad to bring on Stephen Warren on board as a maintainer. The
> work he has done so far is excellent, and the fact that he works for
> Nvidia means he has long-term interest in the platform.
>
> Erik Gilling did an astounding amount of work on getting things up and
> running but has been a silent partner on the maintainership side for a
> while, and is stepping down. Thanks for your contributions so far, Erik.
>
> Finally, update the git URL since I'll take over running the main repo
> for a while.
>
> Overall maintainership model isn't changing much at this time: We'll all
> three review patches as appropriate, and one of us will collect the main
> repo (me at this time).
>
> Signed-off-by: Olof Johansson <olof@lixom.net>
> Cc: Colin Cross <ccross@android.com>
> Cc: Erik Gilling <konkers@android.com>
> Cc: Stephen Warren <swarren@nvidia.com>
> ---
> =A0MAINTAINERS | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ace8f9c..5483e0c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6366,10 +6366,10 @@ F: =A0 =A0 =A0net/ipv4/tcp_lp.c
>
> =A0TEGRA SUPPORT
> =A0M: =A0 =A0 Colin Cross <ccross@android.com>
> -M: =A0 =A0 Erik Gilling <konkers@android.com>
> =A0M: =A0 =A0 Olof Johansson <olof@lixom.net>
> +M: =A0 =A0 Stephen Warren <swarren@nvidia.com>
> =A0L: =A0 =A0 linux-tegra@vger.kernel.org
> -T: =A0 =A0 git git://android.git.kernel.org/kernel/tegra.git
> +T: =A0 =A0 git git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.=
git
> =A0S: =A0 =A0 Supported
> =A0F: =A0 =A0 arch/arm/mach-tegra

Acked-by: Colin Cross <ccross@android.com>
