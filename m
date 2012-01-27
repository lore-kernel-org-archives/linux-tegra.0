From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v1 1/3] ARM: tegra: definitions for flow controller
Date: Fri, 27 Jan 2012 00:15:37 -0800
Message-ID: <CAOesGMhaNybgVvLwT28MNjquRn6K55vRZPOiOyp1Ospg4_-uug@mail.gmail.com>
References: <1327594923-21822-1-git-send-email-pdeschrijver@nvidia.com>
 <1327594923-21822-2-git-send-email-pdeschrijver@nvidia.com>
 <CAOesGMghrFvCzyTaLfeF5RB77UUxpzEQj+j5Ega_uzL1SdbrOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOesGMghrFvCzyTaLfeF5RB77UUxpzEQj+j5Ega_uzL1SdbrOg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, Colin Cross <ccross@android.com>, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 26, 2012 at 6:17 PM, Olof Johansson <olof@lixom.net> wrote:
> Hi,
>
> On Thu, Jan 26, 2012 at 8:22 AM, Peter De Schrijver
> <pdeschrijver@nvidia.com> wrote:
>> Introduce some definitions for the tegra flow contoller. This will be
>> used by the code which controls entering and leaving LP3.
>>
>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>
> Do you expect to use these defines anywhere else than in the sleep.S
> in the near future? If not, please just move them over to that file.

I just looked at the Tegra30 secondary cores patch series, it's used there.

Please ignore.

-Olof
