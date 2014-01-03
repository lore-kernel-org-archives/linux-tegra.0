From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2 4/6] ARM: tegra: rework fuse.c
Date: Fri, 3 Jan 2014 20:19:12 +0900
Message-ID: <CAAVeFuJ2i6N-=bGqjTZNmgD3iT-7vSxaWze+QFLbf4jjhU7dNA@mail.gmail.com>
References: <1387891931-9854-1-git-send-email-pdeschrijver@nvidia.com>
 <1387891931-9854-5-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1387891931-9854-5-git-send-email-pdeschrijver@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Russell King <linux@arm.linux.org.uk>, Herbert Xu <herbert@gondor.apana.org.au>, Stephen Warren <swarren@wwwdotorg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Danny Huang <dahuang@nvidia.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 24, 2013 at 10:32 PM, Peter De Schrijver
<pdeschrijver@nvidia.com> wrote:
> Reduce fuse.c to the minimum functionality required for the early bootstages.
> Also export tegra_read_straps() for use by the fuse driver.
>
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>

Fine with this since the fuse clock is still explicitly enabled during init.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
