From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3] ARM: tegra: cpuidle: use firmware for power down
Date: Wed, 12 Feb 2014 12:04:58 -0800
Message-ID: <CAOesGMhk_chCYJ0Qpj0Sju6k7OQJ+c1_VnfZNTOfw2WPHPyQ4A@mail.gmail.com>
References: <52FAD4C2.80803@nvidia.com>
 <1392173024-11567-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1392173024-11567-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 11, 2014 at 6:43 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:
> Attempt to invoke the prepare_idle() and do_idle() firmware calls
> to power down a CPU so an underlying firmware gets informed of
> the idle operation and performs it by itself if designed in such a way.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Acked-by: Olof Johansson <olof@lixom.net>


-Olof
