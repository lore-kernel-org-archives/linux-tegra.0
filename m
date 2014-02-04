From: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [RFC 10/16] drm/nouveau/timer: skip calibration on GK20A
Date: Tue, 4 Feb 2014 17:39:07 +0900
Message-ID: <52F0A72B.8030900@nvidia.com>
References: <1391224618-3794-1-git-send-email-acourbot@nvidia.com>	<1391224618-3794-11-git-send-email-acourbot@nvidia.com>
	<CACAvsv4T=TRb05OtkxG=t1+Ou9=Of9c-ALWkHJjKYpNi2aGs5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACAvsv4T=TRb05OtkxG=t1+Ou9=Of9c-ALWkHJjKYpNi2aGs5Q@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ben Skeggs <skeggsb@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Eric Brower <ebrower@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Terje Bergstrom <tbergstrom@nvidia.com>, Ken Adams <KAdams@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 02/04/2014 12:55 PM, Ben Skeggs wrote:
> On Sat, Feb 1, 2014 at 1:16 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>> GK20A's timer is directly attached to the system timer and cannot be
>> calibrated. Skip the calibration phase on that chip since the
>> corresponding registers do not exist.
> Just a curiosity:  What timer resolution does the HW initialise at?

On T124 the timer input is the oscillator clock, which depending on the 
device can run between 12 and 48Mhz (IIUC).
